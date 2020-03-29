import 'package:app_5las/src/modules/auth/pages/login_page.dart';
import 'package:app_5las/src/modules/splash/pages/splash_page.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //Page builders
    MaterialPageRoute createMaterialRoute(Widget page, RouteSettings settings) {
      return MaterialPageRoute(builder: (_) => page, settings: settings);
    }
    switch (settings.name) {
      case loginRoute:
        createMaterialRoute(LoginPage(), settings); break;
      case splashRoute:
        createMaterialRoute(SplashPage(), settings); break;
    }
  }

  //Page strings
  static const String loginRoute = 'login';
  static const String splashRoute = 'splash';
}
