part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetDistrictsEvent extends SignupEvent {
  final int departmentId;

  GetDistrictsEvent({@required this.departmentId});

  @override
  List<Object> get props => [departmentId];
}

class SignUpAttemptEvent extends SignupEvent {
  final SignUpParams signUpParams;

  SignUpAttemptEvent({@required this.signUpParams});

  @override
  List<Object> get props => [signUpParams];
}
