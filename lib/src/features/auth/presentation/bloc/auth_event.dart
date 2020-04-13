import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetSignIn extends AuthEvent {
  final String email;
  final String password;

  GetSignIn(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
