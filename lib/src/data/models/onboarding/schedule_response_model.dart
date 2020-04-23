import 'package:app_5las/src/data/models/generateticket/turn_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schedule_response_model.g.dart';

@JsonSerializable()
class ScheduleResponseModel {
  int id;
  String startsAt;
  String endsAt;
  bool active;
  int capacity;
  String createdAt;
  int branchId;
  List<TurnModel> turns;

  ScheduleResponseModel(
      {this.id,
      this.startsAt,
      this.endsAt,
      this.active,
      this.capacity,
      this.createdAt,
      this.branchId,
      this.turns});
  
  factory ScheduleResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ScheduleResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ScheduleResponseModelToJson(this);
}
