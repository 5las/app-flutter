import 'package:app_5las/src/core/error/exceptions.dart';
import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/data/datasources/local_data_source.dart';
import 'package:app_5las/src/data/datasources/remote_data_source.dart';
import 'package:app_5las/src/data/models/auth/login_data_model.dart';
import 'package:app_5las/src/data/models/auth/user_district_model.dart';
import 'package:app_5las/src/features/auth/domain/entities/login_response.dart';
import 'package:app_5las/src/features/auth/domain/entities/user_district.dart';
import 'package:app_5las/src/features/auth/domain/repositories/login_repository.dart';
import 'package:app_5las/src/features/auth/domain/usecases/login_attempt.dart';
import 'package:app_5las/src/utils/jwt_utils.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  AuthRepositoryImpl(
      {@required this.remoteDataSource, @required this.localDataSource});

  @override
  Future<Either<Failure, LoginResponse>> tryLogin(
      LoginParams loginParams) async {
    final jwtParser = JwtUtils();

    try {
      final loginResponseModel = await remoteDataSource.login(loginParams);
      /// Saved token
      await localDataSource.cacheSessionToken(loginResponseModel.accessToken);
      final parsedData = jwtParser.parseJWT(loginResponseModel.accessToken);
      final loginResponse = LoginDataModel.fromJson(parsedData);
      /// Saved session data
      await localDataSource.cacheSessionData(loginResponse);
      return Right(loginResponse);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
