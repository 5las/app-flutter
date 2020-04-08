import 'package:app_5las/src/commons/widgets/default_button.dart';
import 'package:app_5las/src/commons/widgets/default_input_decoration.dart';
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
    var _mediaQuery = MediaQuery.of(context);

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
              padding: EdgeInsets.all(_mediaQuery.size.width * 0.05),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        'Necesitamos algunos datos para crear tu cuenta',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: _mediaQuery.size.height * 0.06,
                      ),
                      Container(
                        height: 60.0,
                        child: TextFormField(
                          autofocus: false,
                          style:
                              TextStyle(fontSize: 16.0, color: AppColors.black),
                          decoration: DefaultInputDecoration(
                              hintText: 'Nombres',
                              prefixIconData: Icons.person),
                        ),
                      ),
                      Container(
                        height: 60.0,
                        child: TextFormField(
                          autofocus: false,
                          style:
                              TextStyle(fontSize: 16.0, color: AppColors.black),
                          decoration: DefaultInputDecoration(
                              hintText: 'DNI/CE',
                              prefixIconData: Icons.person),
                        ),
                      ),
                      Container(
                        height: 60.0,
                        child: TextFormField(
                          autofocus: false,
                          style:
                              TextStyle(fontSize: 16.0, color: AppColors.black),
                          decoration: DefaultInputDecoration(
                              hintText: 'Dirección',
                              prefixIconData: Icons.person),
                        ),
                      ),
                      Container(
                        height: 60.0,
                        child: TextFormField(
                          autofocus: false,
                          style:
                              TextStyle(fontSize: 16.0, color: AppColors.black),
                          decoration: DefaultInputDecoration(
                              hintText: 'Distrito',
                              prefixIconData: Icons.person),
                        ),
                      ),
                      Container(
                        height: 60.0,
                        child: TextFormField(
                          autofocus: false,
                          style:
                              TextStyle(fontSize: 16.0, color: AppColors.black),
                          decoration: DefaultInputDecoration(
                              hintText: 'Email',
                              prefixIconData: Icons.person),
                        ),
                      ),
                      SizedBox(
                        height: _mediaQuery.size.height * 0.04,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                      child: DefaultButton(
                    backgroundColor: AppColors.primaryColor,
                    textColor: AppColors.white,
                    text: 'CREAR CUENTA',
                    onPressed: () {},
                  ))
                ],
              )),
        ))));
  }
}
