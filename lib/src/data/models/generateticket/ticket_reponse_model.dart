import 'package:app_5las/src/data/models/generateticket/turn_model.dart';
import 'package:app_5las/src/data/models/generateticket/user_model.dart';
import 'package:app_5las/src/features/onboarding/domain/entities/ticket.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_reponse_model.g.dart';

@JsonSerializable()
class TicketResponseModel extends Ticket {

  TicketResponseModel({
    @required UserModel user,
    @required String startsEnds,
    @required String place,
    @required String district,
    @required TurnModel turn,
    @required String salt,
    @required String createdAt,
    @required String qr,
    @required int id,
  }):super(
    user:user,
    startsEnds:startsEnds,
    place:place,
    district:district,
    turn:turn,
    salt:salt,
    createdAt:createdAt,
    qr:qr,
    id:id
  );

  factory TicketResponseModel.fromJson(Map<String, dynamic> json) {
    return _$TicketResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TicketResponseModelToJson(this);
}
