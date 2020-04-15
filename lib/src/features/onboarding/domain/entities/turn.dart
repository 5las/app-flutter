import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Turn extends Equatable{
  int id;

  int duration;

  String startsAt;

  String endsAt;

  int capacity;

  int total;

  int scheduleId;

  Turn({
    @required this.id,
    @required this.duration,
    @required this.startsAt,
    @required this.endsAt,
    @required this.capacity,
    @required this.total,
    @required this.scheduleId,
});

  @override
  // TODO: implement props
  List<Object> get props => [id,duration,startsAt,endsAt,capacity,total,scheduleId];


}