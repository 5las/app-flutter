import 'package:app_5las/src/commons/mixins/progress_overlay_mixin.dart';
import 'package:app_5las/src/config/colors.dart';
import 'package:app_5las/src/core/widgets/default_button.dart';
import 'package:app_5las/src/core/widgets/default_input_decoration.dart';
import 'package:app_5las/src/core/widgets/progress_overlay.dart';
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

class _SignUpPageState extends State<SignUpPage> with ProgressOverlayMixin {
  SignupBloc _signUpBloc;

  String _selectedDistrict;
  String _selectedGender;

  ProgressOverlay _progressOverlay;

  @override
  void initState() {
    super.initState();
    _signUpBloc = serviceLocator<SignupBloc>();
    _signUpBloc.add(GetDistrictsEvent(departmentId: 1501));
    _progressOverlay = ProgressOverlay();
  }

  @override
  void showProgress() {
    super.showProgress();
    _progressOverlay.show(context);
  }

  @override
  void hideProgress() {
    super.hideProgress();
    _progressOverlay.hide();
  }

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    var _formKey = GlobalKey<FormState>();

    print('building');

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
              child: BlocListener<SignupBloc, SignupState>(
                  listener: (context, state) {
                    if (state is SignUpLoading) {
                      showProgress();
                    } else if (state is SignUpLoaded) {
                      hideProgress();
                    }
                  },
                  child: SingleChildScrollView(
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: _mediaQuery.size.height * 0.06,
                                  ),
                                  Container(
                                    height: 60.0,
                                    child: TextFormField(
                                      
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Por favor complete este campo';
                                        }
                                        return null;
                                      },
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: AppColors.black),
                                      decoration: DefaultInputDecoration(
                                          hintText: 'Nombre completo',
                                          prefixIconData: Icons.person),
                                    ),
                                  ),
                                  Container(
                                    height: 60.0,
                                    child: TextFormField(
                                      
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Por favor complete este campo';
                                        }
                                        return null;
                                      },
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: AppColors.black),
                                      decoration: DefaultInputDecoration(
                                          hintText: 'DNI/CE',
                                          prefixIconData: Icons.assignment_ind),
                                    ),
                                  ),
                                  Container(
                                    height: 60.0,
                                    child: TextFormField(
                                      
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Por favor complete este campo';
                                        }
                                        return null;
                                      },
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: AppColors.black),
                                      decoration: DefaultInputDecoration(
                                          hintText: 'Dirección',
                                          prefixIconData: Icons.place),
                                    ),
                                  ),
                                  BlocBuilder<SignupBloc, SignupState>(
                                    builder: (context, state) {
                                      if (state is SignUpInitial) {
                                        return Container();
                                      } else if (state is SignUpLoaded) {
                                        return Container(
                                          height: 60,
                                          child: DropdownButtonFormField(
                                            isDense: true,
                                            value: _selectedDistrict,
                                            validator: (value) {
                                              if (value == null ||
                                                  value == '') {
                                                return 'Por favor complete este campo';
                                              }
                                              return null;
                                            },
                                            icon: Padding(
                                                padding:
                                                    EdgeInsets.only(right: 10),
                                                child: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: AppColors.primaryColor,
                                                )),
                                            items:
                                                state.districts.map((district) {
                                              return DropdownMenuItem(
                                                value: district.id,
                                                child: FittedBox(
                                                    child: Text(district.name)),
                                              );
                                            }).toList(),
                                            decoration: DefaultInputDecoration(
                                                hintText: 'Distrito',
                                                prefixIconData: Icons.map),
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedDistrict = value;
                                              });
                                            },
                                          ),
                                        );
                                      } else if (state is SignUpLoading) {
                                        return Container();
                                      }
                                    },
                                  ),
                                  Container(
                                    height: 60.0,
                                    child: DropdownButtonFormField(
                                      isDense: true,
                                      value: _selectedGender,
                                      validator: (value) {
                                        if (value == null || value == '') {
                                          return 'Por favor complete este campo';
                                        }
                                        return null;
                                      },
                                      icon: Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Icon(
                                            Icons.keyboard_arrow_down,
                                            color: AppColors.primaryColor,
                                          )),
                                      items: ['Mujer', 'Hombre'].map((gender) {
                                        return DropdownMenuItem(
                                          value: gender,
                                          child: FittedBox(
                                            child: Text(gender),
                                          ),
                                        );
                                      }).toList(),
                                      decoration: DefaultInputDecoration(
                                          hintText: 'Me identifico como',
                                          prefixIconData: Icons.person_pin),
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedGender = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 60.0,
                                    child: TextFormField(
                                      
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Por favor complete este campo';
                                        }
                                        return null;
                                      },
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: AppColors.black),
                                      decoration: DefaultInputDecoration(
                                          hintText: 'Email',
                                          prefixIconData:
                                              Icons.alternate_email),
                                    ),
                                  ),
                                  Container(
                                    height: 60.0,
                                    child: TextFormField(
                                      
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Por favor complete este campo';
                                        }
                                        return null;
                                      },
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: AppColors.black),
                                      decoration: DefaultInputDecoration(
                                          hintText: 'Contraseña',
                                          prefixIconData: Icons.lock),
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
                                      if (_formKey.currentState.validate()) {
                                        print('Valid signup form');
                                      }
                                    },
                                  ))
                            ],
                          )))),
            ))))));
  }
}
