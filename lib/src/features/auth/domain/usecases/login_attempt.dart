import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/core/usecases/usecase.dart';
import 'package:app_5las/src/features/auth/domain/entities/login_request.dart';
import 'package:app_5las/src/features/auth/domain/entities/login_response.dart';
import 'package:app_5las/src/features/auth/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class LoginAttempt implements UseCase<LoginResponse, LoginParams>{
  final AuthRepository authRepository;

  LoginAttempt({@required this.authRepository});

 Future<Either<Failure, LoginResponse>> call(LoginParams loginParams) async{
    return await authRepository.tryLogin(loginParams);
  }

}

class LoginParams extends Equatable{
  final String email;
  final String password;

  LoginParams({@required this.email, @required this.password});

  @override
  // TODO: implement props
  List<Object> get props => [email,password];

}