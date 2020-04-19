part of 'onboarding_bloc.dart';

abstract class OnBoardingState extends Equatable{
  @override
  List<Object> get props => [];
}

class OnBoardingInitial extends OnBoardingState{}

class OnBoardingLoading extends OnBoardingState{}

class OnBoardingLoaded extends OnBoardingState{
  final LoginResponse sessionData;
  final List<DistrictModel> districts;

  OnBoardingLoaded({this.sessionData, this.districts});

  @override
  // TODO: implement props
  List<Object> get props => [sessionData, districts];

}

class OnBoardingFailure extends OnBoardingState{
  final String error;

  OnBoardingFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'OnBoardingFailure { error: $error }';
}