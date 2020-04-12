import 'package:app_5las/src/features/signin/domain/entities/sigin.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SignInState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends SignInState {}

class Loading extends SignInState {}

class Loaded extends SignInState {
  final SignIn signIn;

  Loaded({@required this.signIn});

  @override
  List<Object> get props => [signIn];
}

class Error extends SignInState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}