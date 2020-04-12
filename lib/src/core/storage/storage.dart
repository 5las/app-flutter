import 'package:app_5las/src/core/network/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Storage {
  void updateToken(String token);
}

class AppStorage implements Storage {
  static final SharedPreferences _preferences = serviceLocator<SharedPreferences>();

  final String _tokenPrefs = "token";

  @override
  void updateToken(String token) => _preferences.setString(_tokenPrefs, token);
}