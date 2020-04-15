import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/core/usecases/usecase.dart';
import 'package:app_5las/src/features/onboarding/domain/entities/company.dart';
import 'package:app_5las/src/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class GetCompanies extends UseCase<List<Company>, CompaniesParams> {
  final OnBoardingRepository onBoardingRepository;

  GetCompanies({@required this.onBoardingRepository});

  @override
  Future<Either<Failure, List<Company>>> call(
      CompaniesParams params) async {
    return await onBoardingRepository.getCompany(params);
  }

}

class CompaniesParams extends Equatable {
  final int districtId;

  CompaniesParams({@required this.districtId});

  @override
  List<Object> get props => [districtId];
}
