import 'package:app_5las/src/features/auth/pages/login_page.dart';
import 'package:app_5las/src/features/onBoarding/pages/onboarding_page.dart';
import 'package:app_5las/src/features/signup/pages/signup_page.dart';
import 'package:app_5las/src/features/splash/pages/splash_page.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //Page builders
    MaterialPageRoute createMaterialRoute(Widget page, RouteSettings settings) {
      return MaterialPageRoute(builder: (_) => page, settings: settings);
    }
    switch (settings.name) {
      case onBoardingRoute:
        createMaterialRoute(OnBoardingPage(), settings); break;
      case loginRoute:
        return createMaterialRoute(LoginPage(), settings); break;
      case splashRoute:
        return createMaterialRoute(SplashPage(), settings); break;
      case signUpRoute:
        return createMaterialRoute(SignUpPage(), settings); break;
    }
  }

  /// Page strings
  static const String onBoardingRoute = 'onBoarding';
  static const String loginRoute = 'login';
  static const String splashRoute = 'splash';
  static const String signUpRoute = 'signup';
}
