import 'package:app_5las/src/config/colors.dart';
import 'package:app_5las/src/config/routes.dart';
import 'package:app_5las/src/modules/splash/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
            providers: [],
            child: MaterialApp(
              title: '5las',
              onGenerateRoute: Router.generateRoute,
              theme: ThemeData(
                fontFamily: 'Montserrat',
                  brightness: Brightness.light,
                  primaryColor: AppColors.primaryColor,
                  accentColor: AppColors.primaryColor[200],
                  backgroundColor: Colors.white,
                  buttonColor: AppColors.primaryColor),
              home: SplashPage(),
            ));
  }
}
