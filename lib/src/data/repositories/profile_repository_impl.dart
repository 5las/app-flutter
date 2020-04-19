import 'package:app_5las/src/core/error/exceptions.dart';
import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/core/usecases/usecase.dart';
import 'package:app_5las/src/data/datasources/local_data_source.dart';
import 'package:app_5las/src/data/datasources/remote_data_source.dart';
import 'package:app_5las/src/features/auth/domain/entities/login_response.dart';
import 'package:app_5las/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class ProfileRepositoryImpl implements ProfileRepository{

  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  ProfileRepositoryImpl({this.localDataSource,@required this.remoteDataSource});

  @override
  Future<Either<Failure, LoginResponse>> getUserDataProfile(NoParams noParams)async {
    try {
      final localData = await localDataSource.getSessionData();
      return Right(localData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}