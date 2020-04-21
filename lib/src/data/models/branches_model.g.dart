// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branches_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchesModel _$BranchesModelFromJson(Map<String, dynamic> json) {
  return BranchesModel(
    id: json['id'] as int,
    name: json['name'] as String,
    address: json['address'] as String,
    lat: json['lat'] as String,
    lng: json['lng'] as String,
    phone: json['phone'] as String,
    district_id: json['district_id'] as int,
    open: json['open'] as bool,
  );
}

Map<String, dynamic> _$BranchesModelToJson(BranchesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'lat': instance.lat,
      'lng': instance.lng,
      'phone': instance.phone,
      'district_id': instance.district_id,
      'open': instance.open,
    };
