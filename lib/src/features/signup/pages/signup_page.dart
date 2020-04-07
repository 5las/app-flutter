import 'package:app_5las/src/config/colors.dart';
import 'package:app_5las/src/config/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.inputHintColor,
          brightness: Brightness.light,
          elevation: 0,
          leading: BackButton(
            color: AppColors.inputHintColor,
          ),
        ),
        backgroundColor: AppColors.inputHintColor,
        body: SizedBox.expand(
            child: SingleChildScrollView(
                child: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(AppSizes.defaultPadding),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Necesitamos algunos datos para crear tu cuenta',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              )),
        ))));
  }
}
