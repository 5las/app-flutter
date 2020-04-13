import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/core/usecases/usecase.dart';
import 'package:app_5las/src/features/signup/domain/entities/district.dart';
import 'package:app_5las/src/features/signup/domain/repositories/signup_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class GetDistricts extends UseCase<List<District>, GetDistrictsParams> {
  final SignUpRepository signUpRepository;

  GetDistricts({@required this.signUpRepository});

  @override
  Future<Either<Failure, List<District>>> call(
      GetDistrictsParams params) async {
    return await signUpRepository.getDistricts(params);
  }
}

class GetDistrictsParams extends Equatable {
  final int departmentId;

  GetDistrictsParams({@required this.departmentId});

  @override
  List<Object> get props => [departmentId];
}
