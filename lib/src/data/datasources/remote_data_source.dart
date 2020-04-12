import 'dart:convert';

import 'package:app_5las/src/core/error/exceptions.dart';
import 'package:app_5las/src/data/models/auth/login_response_model.dart';
import 'package:app_5las/src/features/auth/domain/usecases/login_attempt.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

const API_URL = 'https://5las.renatocenteno.com';

abstract class RemoteDataSource {
  Future<LoginResponseModel> getLoginResponse(LoginParams params);
}

class RemoteDataSourceIml implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceIml({@required this.client});

  @override
  Future<LoginResponseModel> getLoginResponse(LoginParams params) async {
    final Map<String, String> data = {
      'email': params.email,
      'password': params.password
    };

    final response =
        await client.post('$API_URL/auth/signin', body: json.encode(data));

    if (response.statusCode == 200) {
      throw LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
