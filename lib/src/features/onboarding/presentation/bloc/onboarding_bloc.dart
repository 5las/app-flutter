import 'dart:async';

import 'package:app_5las/src/core/usecases/usecase.dart';
import 'package:app_5las/src/data/datasources/local_data_source.dart';
import 'package:app_5las/src/features/auth/domain/entities/login_response.dart';
import 'package:app_5las/src/features/onboarding/domain/entities/district.dart';
import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/features/onboarding/domain/usecases/get_districts.dart';
import 'package:app_5las/src/features/onboarding/domain/usecases/get_user_data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input';

class OnBoardingBloc extends Bloc<OnBoardingEvent,OnBoardingState>{
  final GetDistrict getDistricts;
  final GetUserData getUserData;

  final LocalDataSource localDataSource;

  OnBoardingBloc({this.localDataSource,@required this.getUserData,@required this.getDistricts});

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
      final failureOrUSerData = await getUserData.call(NoParams());
      yield failureOrUSerData.fold(
              (failure) => OnBoardingFailure(error: _mapFailureToMessage(failure)),
              (loginResponse) => OnBoardingLoaded(
                  dni: event.dni,
                  email: event.email,
                  fullname: event.fullname));
    }

    if (event is DistrictEvent) {
      yield OnBoardingLoading();
      final failureOrDistricts = await getDistricts.call(DistrictsParams(departmentId: 1501));
      yield failureOrDistricts.fold(
              (failure) => OnBoardingFailure(error: _mapFailureToMessage(failure)),
              (districts) => OnBoardingLoaded(districts: districts));
    }
  }
}

