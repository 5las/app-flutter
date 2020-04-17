import 'package:app_5las/src/features/auth/domain/entities/user_district.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_district_model.g.dart';

@JsonSerializable()
class UserDistrictModel extends UserDistrict {
  final String id;
  final String name;

  UserDistrictModel({@required this.id, @required this.name})
      : super(id: id, name: name);

  factory UserDistrictModel.fromJson(Map<String, dynamic> json) =>
      _$UserDistrictModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDistrictModelToJson(this);
  
}
