import 'dart:async';

import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/core/usecases/usecase.dart';
import 'package:app_5las/src/data/datasources/local_data_source.dart';
import 'package:app_5las/src/features/profile/domain/usecases/profile_user_data.dart';
import 'package:app_5las/src/features/auth/domain/entities/login_response.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'profile_event.dart';
part 'profile_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input';

class ProfileBloc extends Bloc<ProfileEvent,ProfileState>{
  final ProfileUserData profileUserData;
  final LocalDataSource localDataSource;

  ProfileBloc({this.localDataSource, @required this.profileUserData});

  @override
  ProfileState get initialState => ProfileInitial();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
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
    if (event is ProfileDataEvent) {
      yield ProfileLoading();
      try{

        final failureOrUSerData = await profileUserData.call(NoParams());

        final sessionData   = failureOrUSerData.fold((failure){
          return ProfileFailure(error: _mapFailureToMessage(failure));
        },(sessionData){
          return sessionData;
        }
        );

        yield ProfileLoaded(sessionData: sessionData);
      }catch(e){
        yield ProfileFailure(error: _mapFailureToMessage(e));
      }
    }
  }
}