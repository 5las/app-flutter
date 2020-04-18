part of 'onboarding_bloc.dart';

abstract class OnBoardingState extends Equatable{
  @override
  List<Object> get props => [];
}

SharedPreferences sharedPreferences;

class OnBoardingInitial extends OnBoardingState{}

class OnBoardingLoading extends OnBoardingState{}

class OnBoardingLoaded extends OnBoardingState{
  final List<District> districts;
  final String dni = sharedPreferences.getString('dni');
  final String email = sharedPreferences.getString('email');
  final String fullname = sharedPreferences.getString('fullname');

  OnBoardingLoaded({dni, email, fullname,
    this.districts});

  @override
  // TODO: implement props
  List<Object> get props => [dni,email,fullname,districts];

}

class OnBoardingFailure extends OnBoardingState{
  final String error;

  OnBoardingFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}