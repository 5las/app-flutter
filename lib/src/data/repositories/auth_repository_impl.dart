import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/data/datasources/remote_data_source.dart';
import 'package:app_5las/src/features/auth/domain/entities/login_response.dart';
import 'package:app_5las/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:app_5las/src/features/auth/domain/usecases/login_attempt.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class AuthRepositoryImpl implements AuthRepository{
  final RemoteDataSource remoteDataSource;

  AuthRepositoryImpl({@required this.remoteDataSource});

  @override
  Future<Either<Failure, LoginResponse>> tryLogin(LoginParams params) {
    // TODO: implement tryLogin
    return null;
  }

  
}