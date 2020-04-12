import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SignInEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetConcreteSignIn extends SignInEvent {
  final String email;
  final String password;

  GetConcreteSignIn(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
