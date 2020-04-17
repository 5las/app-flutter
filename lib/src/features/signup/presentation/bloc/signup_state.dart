part of 'signup_bloc.dart';

abstract class SignupState extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignupState {
  
}

class SignUpLoading extends SignupState{}

class SignUpLoaded extends SignupState {
  final List<District> districts;

  SignUpLoaded({@required this.districts});

  @override
  // TODO: implement props
  List<Object> get props => [districts];
}

class SignUpError extends SignupState{}

class SignUpSuccess extends SignupState{}

