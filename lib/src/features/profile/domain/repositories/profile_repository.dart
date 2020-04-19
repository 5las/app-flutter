import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/core/usecases/usecase.dart';
import 'package:app_5las/src/features/auth/domain/entities/login_response.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository{
  Future<Either<Failure, LoginResponse>> getUserDataProfile(NoParams noParams);
}
