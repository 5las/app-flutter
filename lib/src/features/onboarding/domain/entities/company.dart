import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Company extends Equatable{

  String id;

  String name;

  Company({
    @required this.id,
    @required this.name,
});

  @override
  // TODO: implement props
  List<Object> get props => [id,name];

}