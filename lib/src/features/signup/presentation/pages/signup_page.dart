import 'package:app_5las/src/config/colors.dart';
import 'package:app_5las/src/core/widgets/default_button.dart';
import 'package:app_5las/src/core/widgets/default_input_decoration.dart';
import 'package:app_5las/src/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SignupBloc _signUpBloc;

  @override
  void initState() {
    super.initState();
    _signUpBloc = serviceLocator<SignupBloc>();
    _signUpBloc.add(GetDistrictsEvent(departmentId: 1501));
  }

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    var _formKey = GlobalKey<FormState>();

    return BlocProvider(
        create: (_) => _signUpBloc,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.backgroundColor,
              brightness: Brightness.light,
              elevation: 0,
              leading: BackButton(
                color: AppColors.inputHintColor,
              ),
            ),
            backgroundColor: AppColors.backgroundColor,
            body: SizedBox.expand(
                child: SingleChildScrollView(
                    child: SafeArea(
                        child: Padding(
              padding: EdgeInsets.all(_mediaQuery.size.width * 0.05),
              child: Form(
                  key: _formKey,
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
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Por favor complete este campo';
                                }
                                return null;
                              },
                              style: TextStyle(
                                  fontSize: 16.0, color: AppColors.black),
                              decoration: DefaultInputDecoration(
                                  hintText: 'Nombre completo',
                                  prefixIconData: Icons.person),
                            ),
                          ),
                          Container(
                            height: 60.0,
                            child: TextFormField(
                              autofocus: false,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Por favor complete este campo';
                                }
                                return null;
                              },
                              style: TextStyle(
                                  fontSize: 16.0, color: AppColors.black),
                              decoration: DefaultInputDecoration(
                                  hintText: 'DNI/CE',
                                  prefixIconData: Icons.person),
                            ),
                          ),
                          Container(
                            height: 60.0,
                            child: TextFormField(
                              autofocus: false,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Por favor complete este campo';
                                }
                                return null;
                              },
                              style: TextStyle(
                                  fontSize: 16.0, color: AppColors.black),
                              decoration: DefaultInputDecoration(
                                  hintText: 'Dirección',
                                  prefixIconData: Icons.person),
                            ),
                          ),
                          BlocBuilder<SignupBloc, SignupState>(
                            builder: (context, state) {
                              if (state is SignUpInitial) {
                                return Text('EMPTY');
                              } else if (state is SignUpLoaded) {
                                state.districts.forEach((d) {
                                  print(d.name);
                                });
                                return Text('MIRA EL LOG :D');
                              } else if (state is SignUpLoading) {
                                return Text('CARGANDO DISTRITOS');
                              }
                            },
                          ),
                          Container(
                            height: 60.0,
                            child: TextFormField(
                              autofocus: false,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Por favor complete este campo';
                                }
                                return null;
                              },
                              style: TextStyle(
                                  fontSize: 16.0, color: AppColors.black),
                              decoration: DefaultInputDecoration(
                                  hintText: 'Distrito',
                                  prefixIconData: Icons.person),
                            ),
                          ),
                          Container(
                            height: 60.0,
                            child: TextFormField(
                              autofocus: false,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Por favor complete este campo';
                                }
                                return null;
                              },
                              style: TextStyle(
                                  fontSize: 16.0, color: AppColors.black),
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
                            onPressed: () {
                              _formKey.currentState.validate();
                            },
                          ))
                    ],
                  )),
            ))))));
  }
}
