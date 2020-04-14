import 'package:app_5las/src/features/auth/domain/entities/login_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request_model.g.dart';

@JsonSerializable()
class LoginRequestModel extends LoginRequest {
  final String email;
  final String password;

  LoginRequestModel(this.email, this.password) : super(email:email, password:password);

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}
