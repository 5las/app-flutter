part of 'login_bloc.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginLoaded extends AuthState {
  final LoginResponse loginResponse;
  LoginLoaded({@required this.loginResponse});

  @override
  // TODO: implement props
  List<Object> get props => [loginResponse];
}

class LoginFailure extends AuthState {
  final String error;

  LoginFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}
