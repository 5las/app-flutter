import 'package:app_5las/src/commons/widgets/default_button.dart';
import 'package:app_5las/src/config/colors.dart';
import 'package:app_5las/src/config/routes.dart';
import 'package:app_5las/src/config/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class TimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(AppColors.primaryColor);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarIconBrightness: Brightness.dark,
    ));
    var _mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SizedBox.expand(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.defaultPadding,
                    vertical: _mediaQuery.size.height * 0.06),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: _mediaQuery.size.height * 0.08,
                          ),
                          Text(
                            '¡Listo!',
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold),
                          ),
                          Text('Su ticket es válido por 1 hora'),
                          SizedBox(
                            height: _mediaQuery.size.height * 0.08,
                          ),
                          Stack(
                            children: <Widget>[
                              Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          top: AppSizes.defaultPadding),
                                      child: Container(
                                        width: _mediaQuery.size.width -
                                            (AppSizes.defaultPadding * 4),
                                        child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical:
                                                    _mediaQuery.size.height *
                                                        0.06),
                                            child: Text(
                                              '57:23',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      _mediaQuery.size.height *
                                                          0.1),
                                            )),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.primaryColor,
                                              width: 1.5),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20.0),
                                              topRight: Radius.circular(20.0),
                                              bottomLeft: Radius.circular(20.0),
                                              bottomRight:
                                                  Radius.circular(20.0)),
                                        ),
                                      ))),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          right: AppSizes.defaultPadding * 2),
                                      child: CircleAvatar(
                                        backgroundColor:
                                            AppColors.backgroundColor,
                                        child: Icon(
                                          Icons.access_time,
                                          color: AppColors.primaryColor,
                                          size: 34.0,
                                        ),
                                      )))
                            ],
                          )
                        ]),
                    DefaultButton(
                        text: 'FINALIZAR VISITA',
                        onPressed: () =>
                            Navigator.of(context).pushNamed(Router.finalRoute)),
                  ],
                ))),
      ),
    );
  }
}
