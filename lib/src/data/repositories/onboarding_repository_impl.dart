import 'package:app_5las/src/core/error/exceptions.dart';
import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/data/datasources/local_data_source.dart';
import 'package:app_5las/src/data/datasources/remote_data_source.dart';
import 'package:app_5las/src/data/models/auth/login_response_model.dart';
import 'package:app_5las/src/data/models/company_model.dart';
import 'package:app_5las/src/data/models/signup/district_model.dart';
import 'package:app_5las/src/features/auth/domain/entities/login_response.dart';
import 'package:app_5las/src/features/onboarding/domain/entities/company.dart';
import 'package:app_5las/src/features/onboarding/domain/entities/district.dart';
import 'package:app_5las/src/features/onboarding/domain/entities/ticket.dart';
import 'package:app_5las/src/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:app_5las/src/features/onboarding/domain/usecases/get_districts.dart';
import 'package:app_5las/src/features/signup/domain/usecases/get_districts.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class OnBoardingRepositoryImpl implements OnBoardingRepository{

  final RemoteDataSource remoteDataSource;
  final LoginResponseModel responseModel;
  final LocalDataSource localDataSource;
  OnBoardingRepositoryImpl({this.localDataSource, @required this.remoteDataSource, this.responseModel});

  @override
  Future<Either<Failure, List<Company>>> getCompany(getCompany) async {
    try {
      final token = await localDataSource.getSessionToken();
      final companies =
      await remoteDataSource.getCompaniesByDistrict(token,getCompany);
      return Right(companies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<DistrictModel>>> getDistrict(DistrictsParams districtsParams) async {
    try {
      final districts =
      await remoteDataSource.getDistricts(districtsParams.departmentId);
      return Right(districts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Ticket>> getTicket(generateTicketParams) async {
    try {
      final token = await localDataSource.getSessionToken();
      final tickets =
          await remoteDataSource.postGenerateTicket(token,generateTicketParams);
      return Right(tickets);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, LoginResponse>> getUserData(getUserDataParams)async{
    try {
      final localData = await localDataSource.getSessionData();
      return Right(localData);
    } on ServerException{
      return Left(ServerFailure());
    }
  }
}