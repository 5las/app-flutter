import 'package:app_5las/src/features/auth/presentation/pages/login_page.dart';
import 'package:app_5las/src/features/final/presentation/pages/final_page.dart';
import 'package:app_5las/src/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:app_5las/src/features/qr/presentation/pages/qr_page.dart';
import 'package:app_5las/src/features/signup/presentation/pages/signup_page.dart';
import 'package:app_5las/src/features/splash/presentation/pages/splash_page.dart';
import 'package:app_5las/src/features/timer/presentation/pages/timer_page.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //Page builders
    MaterialPageRoute createMaterialRoute(Widget page, RouteSettings settings) {
      return MaterialPageRoute(builder: (_) => page, settings: settings);
    }

    switch (settings.name) {
      case onBoardingRoute:
        return createMaterialRoute(OnBoardingPage(), settings);
        break;
      case splashRoute:
        return createMaterialRoute(SplashPage(), settings);
        break;
      case loginRoute:
        return createMaterialRoute(LoginPage(), settings);
        break;
      case signUpRoute:
        return createMaterialRoute(SignUpPage(), settings);
        break;
      case qrRoute:
        return createMaterialRoute(QrPage(), settings);
        break;
      case timerRoute:
        return createMaterialRoute(TimerPage(), settings);
        break;
      case finalRoute:
        return createMaterialRoute(FinalPage(), settings);
        break;
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
