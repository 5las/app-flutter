// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['id'] as int,
    fullname: json['fullname'] as String,
    dni: json['dni'] as String,
    address: json['address'] as String,
    gender: json['gender'] as String,
    district_id: json['district_id'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    salt: json['salt'] as String,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullname,
      'dni': instance.dni,
      'address': instance.address,
      'gender': instance.gender,
      'district_id': instance.district_id,
      'email': instance.email,
      'password': instance.password,
      'salt': instance.salt,
    };
