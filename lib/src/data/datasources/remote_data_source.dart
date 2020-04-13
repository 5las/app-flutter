import 'dart:convert';

import 'package:app_5las/src/core/error/exceptions.dart';
import 'package:app_5las/src/data/models/auth/login_response_model.dart';
import 'package:app_5las/src/data/models/signup/district_model.dart';
import 'package:app_5las/src/data/models/signup/signup_response_model.dart';
import 'package:app_5las/src/features/auth/domain/usecases/login_attempt.dart';
import 'package:app_5las/src/features/signup/domain/usecases/signup.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

const API_URL = 'https://5las.renatocenteno.com';

abstract class RemoteDataSource {
  Future<LoginResponseModel> getLoginResponse(LoginParams params);

  Future<SignUpResponseModel> signUp(SignUpParams params);

  Future<List<DistrictModel>> getDistricts(int districtId);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({@required this.client});

  @override
  Future<LoginResponseModel> getLoginResponse(LoginParams params) async {
    final Map<String, String> data = {
      'email': params.email,
      'password': params.password
    };

    final response =
        await client.post('$API_URL/auth/signin', body: json.encode(data));

    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<SignUpResponseModel> signUp(SignUpParams params) async {
    final Map<String, dynamic> data = {
      'fullname': params.fullname,
      'address': params.address,
      'dni': params.dni,
      'email': params.email,
      'password': params.password,
      'gender': params.gender,
      'district_id': params.districtId
    };

    final response =
        await client.post('$API_URL/auth/signup', body: json.encode(data));
    //201: Created
    if (response.statusCode == 201) {
      return SignUpResponseModel();
    } else if (response.statusCode == 409) {
      throw DuplicatedException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<DistrictModel>> getDistricts(int departmentId) async {
    final response =
        await client.get('$API_URL/companies/districts/$departmentId');

    if (response.statusCode == 200) {
      //convirtiendo el JSONarray a un List<DistrictModel>
      return (json.decode(response.body) as List)
          .map((e) => DistrictModel.fromJson(e))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
