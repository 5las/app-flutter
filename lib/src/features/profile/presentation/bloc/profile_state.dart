part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable{
  @override
  List<Object> get props => [];
}


class ProfileInitial extends ProfileState{}

class ProfileLoading extends ProfileState{}

class ProfileLoaded extends ProfileState{
  final LoginResponse sessionData;

  ProfileLoaded({this.sessionData});

  @override
  // TODO: implement props
  List<Object> get props => [sessionData];

}

class ProfileFailure extends ProfileState{
  final String error;

  ProfileFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'ProfileFailure { error: $error }';
}