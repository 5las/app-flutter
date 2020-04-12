import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/core/usecases/usecase.dart';
import 'package:app_5las/src/features/signin/domain/entities/sigin.dart';
import 'package:app_5las/src/features/signin/domain/repositories/signin_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class GetConcreteSignIn implements UseCase<SignIn, Params> {
  final SignInRepository _repository;

  GetConcreteSignIn(this._repository);

  @override
  Future<Either<Failure, SignIn>> call(Params params) {
    if(_repository.contains(params.email)){
      if(_repository.isAuthorizeduser(params.email, params.password)){
        _repository.login(params.email, params.password, params.onSuccess, params.onError);
      }else{
        params.onError('wrong password');
      }
    }else{
      params.onError('non registered email');
    }
  }
}

class Params extends Equatable {
  final String email;
  final String password;
  final Function onSuccess;
  final Function onError;

  Params({@required this.email, @required this.password, this.onSuccess, this.onError});

  @override
  List<Object> get props => [email, password];
}

