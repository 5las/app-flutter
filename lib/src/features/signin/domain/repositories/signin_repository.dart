import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/features/signin/domain/entities/sigin.dart';
import 'package:dartz/dartz.dart';

abstract class SignInRepository {
  bool contains(String email) {}

  bool isLoggedIn() {}

  bool isAuthorizeduser(String email, String pass) {}

  Future<Either<Failure, void>> signUpUser(SignIn signIn, Function onSuccess, Function onError) {}

   void logout() {}

  SignIn loggedInUser() {}

  Future<Either<Failure, void>> login(String email, String pass, Function onsuccess, Function onError) {}
}