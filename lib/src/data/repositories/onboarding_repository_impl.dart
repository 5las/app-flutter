import 'package:app_5las/src/core/error/exceptions.dart';
import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/data/datasources/remote_data_source.dart';
import 'package:app_5las/src/data/models/auth/response/login_response_model.dart';
import 'package:app_5las/src/features/auth/domain/entities/login_response.dart';
import 'package:app_5las/src/features/onboarding/domain/entities/company.dart';
import 'package:app_5las/src/features/onboarding/domain/entities/district.dart';
import 'package:app_5las/src/features/onboarding/domain/entities/ticket.dart';
import 'package:app_5las/src/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:app_5las/src/features/signup/domain/usecases/get_districts.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class OnBoardingRepositoryImpl implements OnBoardingRepository{

  final RemoteDataSource remoteDataSource;
  final LoginResponseModel responseModel;
  OnBoardingRepositoryImpl({@required this.remoteDataSource, this.responseModel});

  @override
  Future<Either<Failure, List<Company>>> getCompany(getCompany) async {
    try {
      final companies =
      await remoteDataSource.getCompaniesByDistrict( responseModel.accessToken,getCompany);
      return Right(companies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<District>>> getDistrict(getDistricts) async {
    // TODO: implement getDistrict
    return null;
  }

  @override
  Future<Either<Failure, Ticket>> getTicket(generateTicketParams) async {
    try {
      final tickets =
          await remoteDataSource.postGenerateTicket(responseModel.accessToken,generateTicketParams);
      return Right(tickets);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}