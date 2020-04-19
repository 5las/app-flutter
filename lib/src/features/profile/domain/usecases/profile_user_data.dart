import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/core/usecases/usecase.dart';
import 'package:app_5las/src/features/auth/domain/entities/login_response.dart';
import 'package:app_5las/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class ProfileUserData extends UseCase<LoginResponse, NoParams>{
  final ProfileRepository profileRepository;
  ProfileUserData({@required this.profileRepository});

  @override
  Future<Either<Failure, LoginResponse>> call(NoParams params) async{
    return await profileRepository.getUserDataProfile(params);
  }
}