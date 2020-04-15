import 'package:app_5las/src/features/onboarding/domain/entities/turn.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'turn_model.g.dart';

@JsonSerializable()
class TurnModel extends Turn {

  TurnModel({
    @required int id,
    @required int duration,
    @required String startsAt,
    @required String endsAt,
    @required int capacity,
    @required int total,
    @required int scheduleId,
  }):super(
    id:id,
    duration:duration,
    startsAt:startsAt,
    endsAt:endsAt,
    capacity:capacity,
    total:total,
    scheduleId:scheduleId
  );

  factory TurnModel.fromJson(Map<String, dynamic> json) =>
      _$TurnModelFromJson(json);

  Map<String, dynamic> toJson() => _$TurnModelToJson(this);
}
