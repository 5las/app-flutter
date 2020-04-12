//import 'package:app_5las/src/commons/widgets/default_button.dart';
import 'package:app_5las/src/config/colors.dart';
import 'package:app_5las/src/config/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_svg/svg.dart';

class FinalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(AppColors.primaryColor);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarIconBrightness: Brightness.dark,
    ));
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
        body: SizedBox.expand(
      child: SafeArea(
          child: Container(
        color: AppColors.primaryColor,
        child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding * 1.5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '¡GRACIAS!',
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
                Text('por usar',
                    style: TextStyle(color: AppColors.white, fontSize: 26.0)),
                SizedBox(
                  height: _mediaQuery.size.height * 0.02,
                ),
                CircleAvatar(
                    radius: _mediaQuery.size.width * 0.26,
                    backgroundColor: AppColors.primaryColor[80],
                    child: CircleAvatar(
                      radius: _mediaQuery.size.width * 0.20,
                      backgroundColor: AppColors.primaryColor,
                      child: Padding(
                          padding:
                              EdgeInsets.all(_mediaQuery.size.width * 0.01),
                          child: SvgPicture.asset(
                            'assets/images/app_logo.svg',
                            color: AppColors.white,
                            width: _mediaQuery.size.width * 0.19,
                          )),
                    )),
                SizedBox(
                  height: _mediaQuery.size.height * 0.06,
                ),
               /* DefaultButton(
                  text: '¿Cómo lavarse las manos para evitar el COVID-19?',
                  onPressed: () {},
                  backgroundColor: AppColors.primaryColor[120],
                  elevation: true,
                ),*/
                SizedBox(
                  height: 10.0,
                ),
                /*DefaultButton(
                  text: '¿Cómo lavarse las manos para evitar el COVID-19?',
                  onPressed: () {},
                  backgroundColor: AppColors.primaryColor[120],
                  elevation: true,
                ),*/
                SizedBox(
                  height: _mediaQuery.size.height * 0.08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Hecho con ',
                      style: TextStyle(color: AppColors.white),
                    ),
                    SvgPicture.asset('assets/images/heart.svg'),
                    Text(
                      ' en ',
                      style: TextStyle(color: AppColors.white),
                    ),
                    SvgPicture.asset('assets/images/peru.svg'),
                  ],
                )
              ],
            )),
      )),
    ));
  }
}
