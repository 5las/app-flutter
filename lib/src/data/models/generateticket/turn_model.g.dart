// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turn_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TurnModel _$TurnModelFromJson(Map<String, dynamic> json) {
  return TurnModel(
    id: json['id'] as int,
    duration: json['duration'] as int,
    startsAt: json['startsAt'] as String,
    endsAt: json['endsAt'] as String,
    capacity: json['capacity'] as int,
    total: json['total'] as int,
    scheduleId: json['scheduleId'] as int,
  );
}

Map<String, dynamic> _$TurnModelToJson(TurnModel instance) => <String, dynamic>{
      'id': instance.id,
      'duration': instance.duration,
      'startsAt': instance.startsAt,
      'endsAt': instance.endsAt,
      'capacity': instance.capacity,
      'total': instance.total,
      'scheduleId': instance.scheduleId,
    };
