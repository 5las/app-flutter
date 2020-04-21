import 'package:app_5las/src/data/models/branches_model.dart';
import 'package:app_5las/src/features/onboarding/domain/entities/company.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_model.g.dart';

@JsonSerializable()
class CompanyModel extends Company {
  CompanyModel({
    @required int id,
    @required String name,
    @required String logo_url,
    @required bool available,
    @required List<BranchesModel> branches,
  })
      : super(
      id: id,
      name: name,
      logo_url: logo_url,
      available: available,
      branches: branches
  );

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);
}
