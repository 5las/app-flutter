import 'package:app_5las/src/commons/widgets/default_button.dart';
import 'package:app_5las/src/commons/widgets/default_input_decoration.dart';
import 'package:app_5las/src/commons/widgets/password_decoration.dart';
import 'package:app_5las/src/config/colors.dart';
import 'package:app_5las/src/modules/onBoarding/widgets/districts_aux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

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
                  Icon(
                    Icons.mode_edit,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    height: _mediaQuery.size.height * 0.015,
                  ),
                  Text(
                    'Perfil',
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: _mediaQuery.size.height * 0.02,
                  ),
                  Container(
                    height: 60.0,
                    child: TextFormField(
                      autofocus: false,
                      style: TextStyle(fontSize: 22.0, color: AppColors.black),
                      decoration: DefaultInputDecoration(
                          hintText: 'Usuario'),
                    ),
                  ),
                  Container(
                    height: 60.0,
                    child: TextFormField(
                      autofocus: false,
                      style: TextStyle(fontSize: 22.0, color: AppColors.black),
                      decoration: DefaultInputDecoration(
                          hintText: 'Tipo de documento'),
                    ),
                  ),
                  Container(
                    height: 60.0,
                    child: TextFormField(
                      autofocus: false,
                      style: TextStyle(fontSize: 22.0, color: AppColors.black),
                      decoration: DefaultInputDecoration(
                          hintText: 'Dirección'),
                    ),
                  ),
                  Container(
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColorComboBox,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0),
                        bottomLeft: const Radius.circular(20.0),
                        bottomRight: const Radius.circular(20.0),
                      ),
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal:19.0),
                      child: DropDownDistricts(),
                    ),
                  ),
                  SizedBox(
                    height: _mediaQuery.size.height * 0.02,
                  ),
                  Container(
                    height: 60.0,
                    child: TextFormField(
                      autofocus: false,
                      style: TextStyle(fontSize: 22.0, color: AppColors.black),
                      decoration: DefaultInputDecoration(
                          hintText: 'Correo'),
                    ),
                  ),
                  Container(
                    height: 60.0,
                    child: TextFormField(
                      autofocus: false,
                      style: TextStyle(fontSize: 22.0, color: AppColors.black),
                      decoration: DefaultInputDecoration(
                          hintText: 'Contraseña'
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _mediaQuery.size.height * 0.04,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: DefaultButton(
                        backgroundColor: AppColors.primaryColor,
                        textColor: AppColors.white,
                        text: 'GUARDAR',
                        onPressed: () {},
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
