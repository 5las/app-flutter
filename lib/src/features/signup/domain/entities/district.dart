import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class District extends Equatable {
  final String id;
  final String name;

  District({@required this.id, @required this.name});

  @override
  // TODO: implement props
  List<Object> get props => [id, name];
}