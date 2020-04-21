import 'dart:convert';

import 'package:app_5las/src/core/error/exceptions.dart';
import 'package:app_5las/src/data/models/auth/login_data_model.dart';
import 'package:app_5las/src/features/auth/domain/entities/login_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<LoginResponse> getSessionData();
  Future<String> getSessionToken();

  Future<bool> cacheSessionData(LoginResponse loginData);

    cacheSessionToken(String token);
}

const CACHED_USER_SESSION = 'CACHED_USER_SESSION';
const CACHED_SESSION_TOKEN = 'CACHED_SESSION_TOKEN';

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;
  final storage = FlutterSecureStorage();

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

   cacheSessionToken(String token)async {
    /*final data ={
      'accessToken': token
    };
   await storage.write(key: CACHED_SESSION_TOKEN, value: jsonEncode(data));*/
     return sharedPreferences.setString(CACHED_SESSION_TOKEN, token);
  }

  @override
  Future<String> getSessionToken() async{
    /*final result = await storage.read(key: CACHED_SESSION_TOKEN);
    if(result!=null){
      return jsonDecode(result);
    }
    return null;*/
    return Future.value(sharedPreferences.getString(CACHED_SESSION_TOKEN));
  }
}
