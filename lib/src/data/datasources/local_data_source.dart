import 'dart:convert';

import 'package:app_5las/src/core/error/exceptions.dart';
import 'package:app_5las/src/data/models/auth/login_data_model.dart';
import 'package:app_5las/src/features/auth/domain/entities/login_response.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<LoginResponse> getSessionData();
  Future<String> getSessionToken();

  Future<bool> cacheSessionData(LoginResponse loginData);

  Future<bool> cacheSessionToken(String token);
}

const CACHED_USER_SESSION = 'CACHED_USER_SESSION';
const CACHED_SESSION_TOKEN = 'CACHED_SESSION_TOKEN';

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<bool> cacheSessionData(LoginResponse loginData) {
    return sharedPreferences.setString(
        CACHED_USER_SESSION, json.encode(loginData));
  }

  @override
  Future<LoginResponse> getSessionData() {
    final jsonString = sharedPreferences.getString(CACHED_USER_SESSION);

    if (jsonString != null) {
      return Future.value(LoginDataModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<bool> cacheSessionToken(String token) {
    return sharedPreferences.setString(CACHED_SESSION_TOKEN, token);
  }

  @override
  Future<String> getSessionToken() {
    return Future.value(sharedPreferences.getString(CACHED_SESSION_TOKEN));
  }
}
