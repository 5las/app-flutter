part of 'onboarding_bloc.dart';

abstract class OnBoardingEvent extends Equatable{
  @override
  List<Object> get props => [];
}


class UserDataEvent extends OnBoardingEvent{
  final int departmentId;
  UserDataEvent({@required this.departmentId});
  @override
  List<Object> get props => [departmentId];
}