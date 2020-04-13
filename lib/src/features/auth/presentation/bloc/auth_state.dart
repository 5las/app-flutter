import 'package:app_5las/src/features/auth/domain/entities/login_response.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends AuthState {}

class Loading extends AuthState {}

class Loaded extends AuthState {
  final LoginResponse loginResponse;

  Loaded({@required this.loginResponse});

  @override
  List<Object> get props => [loginResponse];
}

class Error extends AuthState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}