// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) {
  return CompanyModel(
    id: json['id'] as int,
    name: json['name'] as String,
    logo_url: json['logo_url'] as String,
    available: json['available'] as bool,
    branches: (json['branches'] as List)
        ?.map((e) => e == null
            ? null
            : BranchesModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CompanyModelToJson(CompanyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo_url': instance.logo_url,
      'available': instance.available,
      'branches': instance.branches,
    };
