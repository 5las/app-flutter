import 'dart:async';

import 'package:app_5las/src/core/usecases/usecase.dart';
import 'package:app_5las/src/data/datasources/local_data_source.dart';
import 'package:app_5las/src/data/models/company_model.dart';
import 'package:app_5las/src/data/models/signup/district_model.dart';
import 'package:app_5las/src/features/auth/domain/entities/login_response.dart';
import 'package:app_5las/src/features/onboarding/domain/entities/company.dart';
import 'package:app_5las/src/features/onboarding/domain/usecases/get_companies.dart';
import 'package:app_5las/src/features/onboarding/domain/usecases/get_districts.dart';
import 'package:app_5las/src/features/onboarding/domain/entities/district.dart';
import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/features/onboarding/domain/usecases/get_user_data.dart';
import 'package:app_5las/src/features/onboarding/domain/entities/district.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input';

class OnBoardingBloc extends Bloc<OnBoardingEvent,OnBoardingState>{
  final GetDistrict getDistricts;
  final GetUserData getUserData;
  final GetCompanies getCompanies;

  final LocalDataSource localDataSource;

  OnBoardingBloc({
    this.localDataSource,
     this.getUserData,
    this.getDistricts,
    this.getCompanies
  });

  @override
  OnBoardingState get initialState => OnBoardingInitial();

  @override
  Stream<OnBoardingState> mapEventToState(OnBoardingEvent event) async* {

    String _mapFailureToMessage(Failure failure) {
      switch (failure.runtimeType) {
        case ServerFailure:
          return SERVER_FAILURE_MESSAGE;
        case CacheFailure:
          return CACHE_FAILURE_MESSAGE;
        default:
          return 'Unexpected error';
      }
    }

    if(event is UserDataEvent){
      yield OnBoardingLoading();
      try{

        final failureOrDistricts = await getDistricts.call(DistrictsParams(departmentId: event.departmentId));
        final failureOrUSerData = await getUserData.call(NoParams());

        final sessionData   = failureOrUSerData.fold((failure){
          return OnBoardingFailure(error: _mapFailureToMessage(failure));
        },(sessionData){
          return sessionData;
        }
        );
        final distritcs     = failureOrDistricts.fold((failure){
              return OnBoardingFailure(error: _mapFailureToMessage(failure));
            },(district){
          return district;
        }
        );

        yield OnBoardingLoaded(sessionData: sessionData,districts: distritcs);
      }catch(e){
        yield OnBoardingFailure(error: _mapFailureToMessage(e));
      }
    }
    else if(event is LoadCommercesEvent){
      try{
        final failureOrCompanies = await getCompanies.call(CompaniesParams(districtId: event.districtId));
        final companies = failureOrCompanies.fold(
                (failure){
              return OnBoardingFailure(error: _mapFailureToMessage(failure));
            },(companies){
          return companies;

        });
        yield OnBoardingCompanies(companies: companies);
      } catch(e){
        yield OnBoardingFailure(error: _mapFailureToMessage(e));
      }
    }
  }
}

