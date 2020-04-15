import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class LoginRequest extends Equatable{
  final String email;
  final String password;

  LoginRequest({@required this.email,@required this.password});

  @override
  // TODO: implement props
  List<Object> get props => [email,password];

}