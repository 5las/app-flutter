
import 'package:app_5las/src/commons/widgets/default_button.dart';
import 'package:app_5las/src/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _obscureText = true;

  String _password;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
     statusBarColor: AppColors.white,
      statusBarBrightness: Brightness.light
    ));
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 60.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      'Bienvenido a',
                    style: TextStyle(
                        color: AppColors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.normal
                    ),
                  ),
                  Text(
                      '5Las',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 38,
                        fontWeight:FontWeight.bold
                      ),
                  ),
                ],
              ),
              ),
              SizedBox(
              height: 16.0,
            ),
              Padding(
                padding: const EdgeInsets.only(top:20.0),
                child:Theme(
                  data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                  child: Container(
                    height: 60.0,
                    child: TextFormField(
                      autofocus: false,
                      style: TextStyle(fontSize: 22.0, color: AppColors.black),
                      decoration: InputDecoration(
                        suffixIcon: Container(
                          child: Image.asset(
                              'assets/images/user.png',
                            //color: AppColors.primaryColor,
                            color: AppColors.inputHintColor,
                            scale: 2.8,
                          ),
                        ),
                        filled: true,
                        fillColor: Color(0xFFf4f9fc),
                        hintText: 'Correo',
                        contentPadding:
                        const EdgeInsets.only(left: 12.0, bottom: 8.0, top: 12.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Theme(
                data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                child: Container(
                  height: 60.0,
                  child: TextFormField(
                    autofocus: false,
                    style: TextStyle(fontSize: 22.0, color: AppColors.black),
                    obscureText: _obscureText,
                    validator: (val) => val.length < 6 ? 'Verifique su contraseña.' : null,
                    decoration: InputDecoration(
                      hoverColor: AppColors.black,
                      suffixIcon: Container(
                        child: (_obscureText)
                            ?GestureDetector(
                          onTap: _toggle,
                              child: Padding(
                                padding: const EdgeInsets.only(right:10.0),
                                child: Image.asset(
                                'assets/images/eye_hide.png',
                                color: AppColors.inputHintColor,
                                scale: 2.8,),
                              ),
                            )
                            :GestureDetector(
                          onTap: _toggle,
                              child: Padding(
                                padding: const EdgeInsets.only(right:2.0),
                                child: Image.asset(
                          'assets/images/eye_show.png',
                          color: AppColors.inputHintColor,
                          scale: 2.8,
                        ),
                              ),
                            ),
                      ),
                      filled: true,
                      fillColor: Color(0xFFf4f9fc),
                      hintText: 'Contraseña',
                      contentPadding:
                      const EdgeInsets.only(left: 12.0, bottom: 8.0, top: 12.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){},
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    child: Text(
                        '¿Olvidaste tu contraseña?',
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              DefaultButton(
                backgroundColor: AppColors.primaryColor,
                textColor: AppColors.white,
                text: 'INGRESAR',
                onPressed: (){},
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                  child:Container(
                      child: null,
                    ),
                  ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 8.0,
                        child: null,
                      ),
                      Container(
                        height:1.0,
                        width:46.0,
                        color:AppColors.black,
                      ),
                    ],
                  ),
                ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        ' o contnúa con ',
                        style: TextStyle(
                          fontSize: 14.0
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 8.0,
                          child: null,
                          ),
                        Container(
                          height:1.0,
                          width:46.0,
                          color:AppColors.black,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child:Container(
                      child: null,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              SizedBox(
                height: 60.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: (){},
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0)),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.backgroundColorDark,
                                blurRadius: 6,
                                spreadRadius: 2.0,
                                offset: Offset(0, 6))
                          ],
                        ),
                        child:  Image.asset(
                          'assets/images/logo-facebook.png',
                          scale: 2.8,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0)),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.backgroundColorDark,
                                blurRadius: 6,
                                spreadRadius: 2.0,
                                offset: Offset(0, 6,))
                          ],
                        ),
                        child:  Image.asset(
                          'assets/images/logo-google.png',
                          scale: 2.8,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: Text(
                        '¿Aún no tienes una cuenta?',
                        style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: Text(
                          'Regístrate',
                          style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggle(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}