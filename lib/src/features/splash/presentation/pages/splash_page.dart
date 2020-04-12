import 'package:app_5las/src/core/widgets/default_button.dart';
import 'package:app_5las/src/config/colors.dart';
import 'package:app_5las/src/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    FlutterStatusbarcolor.setStatusBarColor(AppColors.primaryColor);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
      body: Container(
          color: AppColors.primaryColor,
          child: SizedBox.expand(
              child: SafeArea(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                  radius: _mediaQuery.size.width * 0.38,
                  backgroundColor: AppColors.primaryColor[80],
                  child: CircleAvatar(
                      radius: _mediaQuery.size.width * 0.32,
                      backgroundColor: AppColors.primaryColor[60],
                      child: CircleAvatar(
                          radius: _mediaQuery.size.width * 0.26,
                          backgroundColor: AppColors.primaryColor[40],
                          child: CircleAvatar(
                            radius: _mediaQuery.size.width * 0.20,
                            backgroundColor: Colors.white,
                            child: Padding(
                                padding: EdgeInsets.all(
                                    _mediaQuery.size.width * 0.01),
                                child: SvgPicture.asset(
                                  'assets/images/app_logo.svg',
                                  width: _mediaQuery.size.width * 0.19,
                                )),
                          )))),
              SizedBox(
                height: _mediaQuery.size.height * 0.05,
              ),
              DefaultButton(
                backgroundColor: Colors.white,
                textColor: AppColors.primaryColor,
                text: 'EMPECEMOS',
                onPressed: () {
                  FlutterStatusbarcolor.setStatusBarColor(AppColors.white);
                  Navigator.pushNamed(context, Router.loginRoute);
                },
              ),
              SizedBox(
                height: _mediaQuery.size.height * 0.05,
              ),
              Text(
                '#YoMeQuedoEnCasa',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )
            ],
          )))),
    );
  }
}
