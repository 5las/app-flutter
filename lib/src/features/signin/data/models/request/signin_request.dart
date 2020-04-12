import 'package:app_5las/src/features/signin/domain/entities/sigin.dart';
import 'package:meta/meta.dart';

class SignInRequest extends SignIn{
  SignInRequest({
    @required String email,
    @required String password,
  }):super(email:email,password:password);

  factory SignInRequest.fromJson(Map<String, dynamic> json){
    return SignInRequest(
        email: json['email'],
        password: json['password'],
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'email': email,
      'password': password
    };
  }
}