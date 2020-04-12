import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class UserDistrict extends Equatable{
  final String id;
  final String name;

  UserDistrict({@required this.id, @required this.name});

  @override
  List<Object> get props => [id, name];

  
}