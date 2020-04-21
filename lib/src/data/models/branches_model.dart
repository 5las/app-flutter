import 'package:app_5las/src/features/onboarding/domain/entities/branch.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';


part 'branches_model.g.dart';

@JsonSerializable()
class BranchesModel extends Branches{
  BranchesModel({
    @required int id,
    @required String name,
    @required String address,
    @required String lat,
    @required String lng,
    @required String phone,
    @required int district_id,
    @required bool open
}):super(
    id:id,
    name: name,
    address: address,
    lat: lat,
    lng: lng,
    phone: phone,
    district_id: district_id,
    open: open
  );

  factory BranchesModel.fromJson(Map<String, dynamic> json) =>
      _$BranchesModelFromJson(json);

  Map<String, dynamic> toJson() => _$BranchesModelToJson(this);

}