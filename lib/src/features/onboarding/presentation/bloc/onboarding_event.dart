part of 'onboarding_bloc.dart';

abstract class OnBoardingEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class DistrictEvent extends OnBoardingEvent{
  final int departmentId;

  DistrictEvent({@required this.departmentId});

  @override
  List<Object> get props => [departmentId];
}


class UserDataEvent extends OnBoardingEvent{

  @override
  List<Object> get props => [];



}