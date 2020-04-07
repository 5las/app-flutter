import 'package:app_5las/src/commons/widgets/default_button.dart';
import 'package:app_5las/src/commons/widgets/default_input_decoration.dart';
import 'package:app_5las/src/commons/widgets/password_decoration.dart';
import 'package:app_5las/src/commons/widgets/shadowed_container.dart';
import 'package:app_5las/src/config/colors.dart';
import 'package:app_5las/src/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppColors.white, statusBarBrightness: Brightness.dark));
    var _mediaQuery = MediaQuery.of(context);

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.dark// transparent status bar
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(_mediaQuery.size.width * 0.05),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: _mediaQuery.size.height * 0.12,
                  ),
                  Text(
                    'Bienvenido a',
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    '5Las',
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 38,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: _mediaQuery.size.height * 0.04,
                  ),
                  Container(
                    height: 60.0,
                    child: TextFormField(
                      autofocus: false,
                      style: TextStyle(fontSize: 22.0, color: AppColors.black),
                      decoration: DefaultInputDecoration(
                          hintText: 'Correo', suffixIcon: Icon(Icons.person)),
                    ),
                  ),
                  Container(
                    height: 60.0,
                    child: TextFormField(
                      autofocus: false,
                      style: TextStyle(fontSize: 22.0, color: AppColors.black),
                      obscureText: _obscureText,
                      validator: (val) =>
                          val.length < 6 ? 'Verifique su contraseña.' : null,
                      decoration: PasswordDecoration(
                          obscureText: _obscureText, onTap: _toggle),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        child: Text(
                          '¿Olvidaste tu contraseña?',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 13.0, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _mediaQuery.size.height * 0.05,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: DefaultButton(
                        backgroundColor: AppColors.primaryColor,
                        textColor: AppColors.white,
                        text: 'INGRESAR',
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoardingPage()));
                        },
                      )),
                  SizedBox(
                    height: _mediaQuery.size.height * 0.03,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 1,
                          width: 40,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text('o continuar con'),
                        SizedBox(
                          width: 10.0,
                        ),
                        Container(
                          height: 1,
                          width: 40,
                          color: Colors.black,
                        ),
                      ]),
                  SizedBox(
                    height: _mediaQuery.size.height * 0.04,
                  ),
                  SizedBox(
                    height: 60.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {},
                            child: ShadowedBox(
                              width: 50.0,
                              height: 50.0,
                              child: SvgPicture.asset(
                                'assets/images/facebook_logo.svg',
                              ),
                            )),
                        SizedBox(
                          width: 20.0,
                        ),
                        GestureDetector(
                            onTap: () {},
                            child: ShadowedBox(
                              width: 50.0,
                              height: 50.0,
                              child: SvgPicture.asset(
                                'assets/images/google_logo.svg',
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _mediaQuery.size.height * 0.04,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: Text(
                        '¿Aún no tienes una cuenta?',
                        style: TextStyle(
                            fontSize: 13.0, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: Text(
                          'Regístrate',
                          style: TextStyle(
                              fontSize: 13.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
