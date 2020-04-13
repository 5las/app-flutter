import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/features/auth/domain/entities/login_response.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input';

class AuthBloc extends Bloc<AuthEvent, AuthState>{

  @override
  AuthState get initialState => Empty();


  Stream<AuthState> _eitherLoadedOrErrorState(
      Either<Failure,LoginResponse> failureOrTrivia,
      ) async* {
    yield failureOrTrivia.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (loginResponse) => Loaded(loginResponse: loginResponse),
    );
  }

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

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) {
    // TODO: implement mapEventToState
    return null;
  }

}