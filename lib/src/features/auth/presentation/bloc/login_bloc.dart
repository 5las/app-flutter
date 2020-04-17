import 'package:equatable/equatable.dart';
import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/features/auth/domain/entities/login_response.dart';
import 'package:app_5las/src/features/auth/domain/usecases/login_attempt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input';

class  AuthBloc extends Bloc<AuthEvent, AuthState>{

  final LoginAttempt loginAttempt;

  AuthBloc({@required this.loginAttempt});

  @override
  AuthState get initialState => LoginInitial();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {

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

   if(event is  LogInEvent){
        yield LoginLoading();

        final failureOrLogin = await loginAttempt.call(LoginParams(email: event.email,password: event.password));

        yield failureOrLogin.fold(
             (failure) => LoginFailure(error: _mapFailureToMessage(failure)),
             (loginResponse) => LoginLoaded(loginResponse: loginResponse),
       );


   }

   if(event is LoggedOut){

   }

  }

}