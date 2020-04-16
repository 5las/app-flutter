import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/core/usecases/usecase.dart';
import 'package:app_5las/src/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:app_5las/src/features/onboarding/domain/entities/district.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class GetDistrict extends UseCase<List<District>, DistrictsParams> {
  final OnBoardingRepository onBoardingRepository;

  GetDistrict({@required this.onBoardingRepository});

  @override
  Future<Either<Failure, List<District>>> call(
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
