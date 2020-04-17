import 'package:app_5las/src/core/error/exceptions.dart';
import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/data/datasources/remote_data_source.dart';
import 'package:app_5las/src/features/signup/domain/entities/district.dart';
import 'package:app_5las/src/features/signup/domain/entities/signup_response.dart';
import 'package:app_5las/src/features/signup/domain/repositories/signup_repository.dart';
import 'package:app_5las/src/features/signup/domain/usecases/get_districts.dart';
import 'package:app_5las/src/features/signup/domain/usecases/signup.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final RemoteDataSource remoteDataSource;

  SignUpRepositoryImpl({@required this.remoteDataSource});

  @override
  Future<Either<Failure, List<District>>> getDistricts(
      GetDistrictsParams getDistrictsParams) async {
    try {
      final districts =
          await remoteDataSource.getDistricts(getDistrictsParams.departmentId);
      return Right(districts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, SignUpResponse>> signUp(SignUpParams signUpParams) {
    // TODO: implement signUp
    return null;
  }
}
