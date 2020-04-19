import 'package:app_5las/src/features/signup/domain/entities/district.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'district_model.g.dart';

@JsonSerializable()
class DistrictModel extends District  {
  DistrictModel({@required String id, @required String name})
      : super(id: id, name: name);
  
  factory DistrictModel.fromJson(Map<String, dynamic> json) =>
      _$DistrictModelFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictModelToJson(this);
}
