// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleResponseModel _$ScheduleResponseModelFromJson(
    Map<String, dynamic> json) {
  return ScheduleResponseModel(
    id: json['id'] as int,
    startsAt: json['startsAt'] as String,
    endsAt: json['endsAt'] as String,
    active: json['active'] as bool,
    capacity: json['capacity'] as int,
    createdAt: json['createdAt'] as String,
    branchId: json['branchId'] as int,
    turns: (json['turns'] as List)
        ?.map((e) =>
            e == null ? null : TurnModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ScheduleResponseModelToJson(
        ScheduleResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startsAt': instance.startsAt,
      'endsAt': instance.endsAt,
      'active': instance.active,
      'capacity': instance.capacity,
      'createdAt': instance.createdAt,
      'branchId': instance.branchId,
      'turns': instance.turns,
    };
