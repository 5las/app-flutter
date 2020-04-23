import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/core/usecases/usecase.dart';
import 'package:app_5las/src/data/models/onboarding/schedule_response_model.dart';
import 'package:app_5las/src/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class GetSchedule extends UseCase<ScheduleResponseModel, GetScheduleParams> {
  final OnBoardingRepository onBoardingRepository;

  GetSchedule({@required this.onBoardingRepository});

  @override
  Future<Either<Failure, ScheduleResponseModel>> call(
      GetScheduleParams params) async {
    return await onBoardingRepository.getScheduleForBranch(params);
  }
}

class GetScheduleParams {
  final int branchId;

  GetScheduleParams({this.branchId});
}
