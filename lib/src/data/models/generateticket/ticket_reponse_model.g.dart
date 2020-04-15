// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_reponse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketResponseModel _$TicketResponseModelFromJson(Map<String, dynamic> json) {
  return TicketResponseModel(
    user: json['user'] == null
        ? null
        : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    startsEnds: json['startsEnds'] as String,
    place: json['place'] as String,
    district: json['district'] as String,
    turn: json['turn'] == null
        ? null
        : TurnModel.fromJson(json['turn'] as Map<String, dynamic>),
    salt: json['salt'] as String,
    createdAt: json['createdAt'] as String,
    qr: json['qr'] as String,
    id: json['id'] as int,
  );
}

Map<String, dynamic> _$TicketResponseModelToJson(
        TicketResponseModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'startsEnds': instance.startsEnds,
      'place': instance.place,
      'district': instance.district,
      'turn': instance.turn,
      'salt': instance.salt,
      'createdAt': instance.createdAt,
      'qr': instance.qr,
      'id': instance.id,
    };
