import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Branches extends Equatable{
  int id;
  String name;
  String address;
  String lat;
  String lng;
  String phone;
  int district_id;
  bool open;

  Branches({
    @required this.id,
    @required this.name,
    @required this.address,
    @required this.lat,
    @required this.lng,
    @required this.phone,
    @required this.district_id,
    @required this.open,
});

  @override
  // TODO: implement props
  List<Object> get props => [
    id,
    name,
    address,
    lat,
    lng,
    phone,
    district_id,
    open
  ];

}