part of 'login_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LogInEvent extends AuthEvent {
  final String email;
  final String password;

  LogInEvent(this.email,this.password);

  @override
  List<Object> get props => [email, password];
}

class LoggedOut extends AuthEvent {}
