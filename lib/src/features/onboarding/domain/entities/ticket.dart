import 'package:app_5las/src/data/models/generateticket/turn_model.dart';
import 'package:app_5las/src/data/models/generateticket/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Ticket extends Equatable {
  UserModel user;

  String startsEnds;

  String place;

  String district;

  TurnModel turn;

  String salt;

  String createdAt;

  String qr;

  int id;

  Ticket({
    @required this.user,
    @required this.startsEnds,
    @required this.place,
    @required this.district,
    @required this.turn,
    @required this.salt,
    @required this.createdAt,
    @required this.qr,
    @required this.id
});

  @override
  // TODO: implement props
  List<Object> get props => [user,startsEnds,place,district,turn,salt,createdAt,qr,id];

}