import 'dart:collection';

import 'package:app_5las/src/core/error/exceptions.dart';
import 'package:app_5las/src/core/network/network_info.dart';
import 'package:meta/meta.dart';

import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/features/signin/domain/entities/sigin.dart';
import 'package:app_5las/src/features/signin/domain/repositories/signin_repository.dart';
import 'package:dartz/dartz.dart';

class SignInRepositoryImpl implements SignInRepository{


  final NetworkInfo networkInfo;

  HashMap<String, SignIn> _signIn = HashMap();
  SignIn loggedinUser;

  SignInRepositoryImpl({
    @required this.networkInfo});

  @override
  bool contains(String email) {
    return _signIn[email] != null;
  }

  @override
  bool isLoggedIn() {
    return loggedinUser != null;
  }

  @override
  bool isAuthorizeduser(String email, String pass) {
    return _signIn[email] != null &&
        _signIn[email.toLowerCase()].getPassword() == pass;
  }

  @override
  void logout() {
    loggedinUser = null;
  }

  @override
   loggedInUser() {
    return loggedinUser;
  }

  @override
  Future<Either<Failure,void>> login(String email, String pass, Function onsuccess, Function onError) {
    try {
      loggedinUser = _signIn[email];
      onsuccess();
    } catch (e) {
      onError('Something went wrong!');
    }
  }


  @override
  Future<Either<Failure, void>> signUpUser(SignIn signIn, Function onSuccess, Function onError) {
    // TODO: implement signUpUser
    return null;
  }

}