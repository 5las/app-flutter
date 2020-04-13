import 'package:app_5las/src/config/colors.dart';
import 'package:app_5las/src/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:app_5las/src/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:app_5las/src/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [const Locale('es')],
      title: '5las',
      onGenerateRoute: Router.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: 'Montserrat',
          primaryColor: AppColors.primaryColor,
          accentColor: AppColors.primaryColor[200],
          backgroundColor: Colors.white,
          buttonColor: AppColors.primaryColor),
      home: SplashPage(),
    );
  }
}
