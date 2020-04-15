import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class User extends Equatable{
  int id;

  String fullname;

  String dni;

  String address;

  String gender;

  String district_id;

  String email;

  String password;

  String salt;

  User({
    @required this.id,
    @required this.fullname,
    @required this.dni,
    @required this.address,
    @required this.gender,
    @required this.district_id,
    @required this.email,
    @required this.password,
    @required this.salt,
  });

  @override
  // TODO: implement props
  List<Object> get props => [id,fullname,dni,address,gender,district_id,email,password,salt];
}