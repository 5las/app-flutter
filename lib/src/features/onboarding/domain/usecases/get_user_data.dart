import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/core/usecases/usecase.dart';
import 'package:app_5las/src/features/auth/domain/entities/login_response.dart';
import 'package:app_5las/src/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class GetUserData extends UseCase<LoginResponse, NoParams>{
  final OnBoardingRepository onBoardingRepository;
  GetUserData({@required this.onBoardingRepository});

  @override
  Future<Either<Failure, LoginResponse>> call(NoParams params) async {
    return await onBoardingRepository.getUserData(params);
  }

}

