import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/core/usecases/usecase.dart';
import 'package:app_5las/src/data/models/signup/district_model.dart';
import 'package:app_5las/src/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:app_5las/src/features/onboarding/domain/entities/district.dart';
import 'package:app_5las/src/features/signup/domain/usecases/get_districts.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class GetDistrict extends UseCase<List<DistrictModel>, DistrictsParams> {
  final OnBoardingRepository onBoardingRepository;

  GetDistrict({@required this.onBoardingRepository});

  @override
  Future<Either<Failure, List<DistrictModel>>> call(
      DistrictsParams params) async {
    return await onBoardingRepository.getDistrict(params);
  }
}

class DistrictsParams extends Equatable {
  final int departmentId;

  DistrictsParams({@required this.departmentId});

  @override
  List<Object> get props => [departmentId];
}
