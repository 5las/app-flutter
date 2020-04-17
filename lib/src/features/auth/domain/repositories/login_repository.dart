import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/features/auth/domain/entities/login_response.dart';
import 'package:app_5las/src/features/auth/domain/usecases/login_attempt.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponse>> tryLogin(LoginParams loginParams);

}
