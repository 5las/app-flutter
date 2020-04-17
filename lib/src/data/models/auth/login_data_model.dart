import 'package:app_5las/src/data/models/auth/user_district_model.dart';
import 'package:app_5las/src/features/auth/domain/entities/login_response.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_data_model.g.dart';

@JsonSerializable()
class LoginDataModel extends LoginResponse {
  final String dni;
  final String email;
  final UserDistrictModel district;
  final String fullname;

  LoginDataModel(
      {@required this.dni,
      @required this.email,
      @required this.district,
      @required this.fullname})
      : super(dni: dni, email: email, district: district, fullname: fullname);

  factory LoginDataModel.fromJson(Map<String, dynamic> json) =>
      _$LoginDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataModelToJson(this);
}
