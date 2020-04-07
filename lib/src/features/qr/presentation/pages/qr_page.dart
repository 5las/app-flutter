import 'package:app_5las/src/commons/widgets/shadowed_container.dart';
import 'package:app_5las/src/config/colors.dart';
import 'package:app_5las/src/config/routes.dart';
import 'package:app_5las/src/config/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_svg/svg.dart';

class QrPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(AppColors.primaryColor);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarIconBrightness: Brightness.dark,
    ));

    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        elevation: 0,
      ),
      body: SizedBox.expand(
          child: Stack(children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Container(
                color: AppColors.primaryColor,
              ),
            ),
            Expanded(
                flex: 6,
                child: Container(color: AppColors.backgroundColorDark)),
          ],
        ),
        Padding(
            padding: EdgeInsets.all(AppSizes.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Luis Delgado',
                  style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0),
                ),
                Text('DNI: 42343232', style: TextStyle(color: AppColors.white)),
                SizedBox(
                  height: _mediaQuery.size.height * 0.06,
                ),
                Text('Tienda: Metro Barranco',
                    style: TextStyle(color: AppColors.white)),
                Text('Horario de visita: 15:00 - 16:00 hrs',
                    style: TextStyle(color: AppColors.white)),
                SizedBox(
                  height: _mediaQuery.size.height * 0.04,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: _mediaQuery.size.width * 0.6,
                      height: _mediaQuery.size.width * 0.6,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(AppSizes.defaultPadding),
                        child: GestureDetector(
                            onTap: () => Navigator.of(context)
                                .pushNamed(Router.timerRoute),
                            child: SvgPicture.asset(
                              'assets/images/google_logo.svg',
                              height: _mediaQuery.size.width * 0.6 -
                                  AppSizes.defaultPadding,
                              width: _mediaQuery.size.width * 0.6 -
                                  AppSizes.defaultPadding,
                            )),
                      ),
                    )),
                SizedBox(
                  height: _mediaQuery.size.height * 0.04,
                ),
                Align(
                    alignment: Alignment.center,
                    child:
                        Text('Muestra este código para ingresar a la tienda'))
              ],
            ))
      ])),
    );
  }
}
