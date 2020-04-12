import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SignInResponse{

  String dni;

  String email;

  String fullname;

  List<District> districts;

  String iat;

  String exp;


  SignInResponse({
    this.dni,
    this.email,
    this.fullname,
    this.districts,
    this.iat,
    this.exp
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) {

    var list = json['district'] as List;
    print(list.runtimeType);
    List<District> districtList = list.map((i) => District.fromJson(i)).toList();
    return SignInResponse(
      dni: json['dni'],
      email: json['email'],
      fullname: json['fullname'],
      districts: districtList,
      iat: json['iat'],
      exp: json['exp'],
    );
  }

}

class District{
  int id;
  String name;

  District({this.id, this.name});

  factory District.fromJson(Map<String, dynamic> parsedJson){
    return District(
        id:parsedJson['id'],
        name:parsedJson['name']
    );
  }

}