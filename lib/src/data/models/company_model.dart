import 'package:app_5las/src/features/onboarding/domain/entities/company.dart';
import 'package:app_5las/src/features/signup/domain/entities/district.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_model.g.dart';

@JsonSerializable()
class CompanyModel extends Company {
  CompanyModel({@required String id, @required String name})
      : super(id: id, name: name);

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);
}
