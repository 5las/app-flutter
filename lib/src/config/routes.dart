import 'package:app_5las/src/modules/auth/pages/login_page.dart';
import 'package:app_5las/src/modules/final/pages/final_page.dart';
import 'package:app_5las/src/modules/qr/pages/qr_page.dart';
import 'package:app_5las/src/modules/signup/pages/signup_page.dart';
import 'package:app_5las/src/modules/onBoarding/pages/onboarding_page.dart';
import 'package:app_5las/src/modules/splash/pages/splash_page.dart';
import 'package:app_5las/src/modules/timer/pages/timer_page.dart';
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
      case qrRoute:
        return createMaterialRoute(QrPage(), settings); break;
      case timerRoute:
        return createMaterialRoute(TimerPage(), settings); break;
      case finalRoute:
        return createMaterialRoute(FinalPage(), settings); break;
    }
  }

  /// Page strings
  static const String onBoardingRoute = 'onBoarding';
  static const String loginRoute = 'login';
  static const String splashRoute = 'splash';
  static const String signUpRoute = 'signup';
  static const String qrRoute = 'qr';
  static const String timerRoute = 'timer';
  static const String finalRoute = 'final';
}
