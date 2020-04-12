import 'package:app_5las/src/features/auth/domain/entities/user_district.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class LoginResponse extends Equatable {
  final String dni;
  final String email;
  final UserDistrict district;
  final String fullname;

  LoginResponse(
      {@required this.dni,
      @required this.email,
      @required this.district,
      @required this.fullname});

  @override
  List<Object> get props => [dni, email, district, fullname];
}
