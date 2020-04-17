import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/core/usecases/usecase.dart';
import 'package:app_5las/src/features/signup/domain/entities/signup_response.dart';
import 'package:app_5las/src/features/signup/domain/repositories/signup_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class SignUp extends UseCase<SignUpResponse, SignUpParams> {
  final SignUpRepository signUpRepository;

  SignUp({@required this.signUpRepository});

  @override
  Future<Either<Failure, SignUpResponse>> call(params) async {
    return await signUpRepository.signUp(params);
  }
}

class SignUpParams extends Equatable {
  final String fullname;
  final String address;
  final String dni;
  final String email;
  final String password;
  final String gender;
  //Sent using district_id
  final int districtId;

  SignUpParams(
      {@required this.fullname,
      @required this.address,
      @required this.dni,
      @required this.email,
      @required this.password,
      @required this.gender,
      @required this.districtId});
  @override
  List<Object> get props =>
      [fullname, address, dni, email, password, gender, districtId];
}
