part of 'onboarding_bloc.dart';

abstract class OnBoardingEvent extends Equatable{
  @override
  List<Object> get props => [];
}


class UserDataEvent extends OnBoardingEvent{
  final int departmentId;
  UserDataEvent({this.departmentId});
  @override
  List<Object> get props => [departmentId];
}

class LoadCommercesEvent extends OnBoardingEvent{
  final int districtId;
  LoadCommercesEvent({this.districtId});
  @override
  List<Object> get props => [districtId];
}