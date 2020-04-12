import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class SignIn{
  final String email;
  final String password;

  SignIn({
    @required this.email,
    @required this.password,
  }): super();

  String getEmail() {
    return email;
  }

  String getPassword() {
    return password;
  }

}