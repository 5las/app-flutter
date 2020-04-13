import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/features/signup/domain/entities/district.dart';
import 'package:app_5las/src/features/signup/domain/entities/signup_response.dart';
import 'package:app_5las/src/features/signup/domain/usecases/get_districts.dart';
import 'package:app_5las/src/features/signup/domain/usecases/signup.dart';
import 'package:dartz/dartz.dart';

abstract class SignUpRepository {
  Future<Either<Failure, SignUpResponse>> signUp(SignUpParams signUpParams);
  Future<Either<Failure, List<District>>> getDistricts(
      GetDistrictsParams getDistrictsParams);
}
