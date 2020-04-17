// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDataModel _$LoginDataModelFromJson(Map<String, dynamic> json) {
  return LoginDataModel(
    dni: json['dni'] as String,
    email: json['email'] as String,
    district: json['district'] == null
        ? null
        : UserDistrictModel.fromJson(json['district'] as Map<String, dynamic>),
    fullname: json['fullname'] as String,
  );
}

Map<String, dynamic> _$LoginDataModelToJson(LoginDataModel instance) =>
    <String, dynamic>{
      'dni': instance.dni,
      'email': instance.email,
      'district': instance.district,
      'fullname': instance.fullname,
    };
