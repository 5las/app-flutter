import 'package:app_5las/src/core/error/exceptions.dart';
import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/data/datasources/remote_data_source.dart';
import 'package:app_5las/src/features/auth/domain/entities/login_request.dart';
import 'package:app_5las/src/features/auth/domain/entities/login_response.dart';
import 'package:app_5las/src/features/auth/domain/entities/user_district.dart';
import 'package:app_5las/src/features/auth/domain/repositories/login_repository.dart';
import 'package:app_5las/src/features/auth/domain/usecases/login_attempt.dart';
import 'package:app_5las/src/utils/jwt_utils.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remoteDataSource;

  AuthRepositoryImpl({@required this.remoteDataSource});

  @override
  Future<Either<Failure, LoginResponse>> tryLogin(LoginParams loginParams) async {
    final jwtParser = JwtUtils();

    try {
      final loginResponseModel =
          await remoteDataSource.login(loginParams);
      final parsedData = jwtParser.parseJWT(loginResponseModel.accessToken);
      final loginResponse = LoginResponse(
          dni: parsedData['dni'],
          email: parsedData['email'],
          fullname: parsedData['fullname'],
          district: UserDistrict(
              id: parsedData['district']['id'],
              name: parsedData['district']['name']));
      return Right(loginResponse);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
