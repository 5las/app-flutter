import 'package:app_5las/src/features/onboarding/domain/entities/ticket.dart';
import 'package:app_5las/src/features/onboarding/domain/entities/user.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {

  UserModel({
    @required int id,
    @required String fullname,
    @required String dni,
    @required String address,
    @required String gender,
    @required String district_id,
    @required String email,
    @required String password,
    @required String salt,

  }):super(
    id:id,
    fullname:fullname,
    dni:dni,
    address:address,
    gender:gender,
    district_id: district_id,
    email:email,
    password:password,
    salt: salt
  );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
