import 'package:app_5las/src/config/colors.dart';
import 'package:app_5las/src/config/routes.dart';
import 'package:app_5las/src/features/auth/presentation/pages/login_page.dart';
import 'package:app_5las/src/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {

  OnBoardingBloc _onBoardingBloc;

  @override
  void initState() {
    _onBoardingBloc = serviceLocator<OnBoardingBloc>();
    _onBoardingBloc.add(UserDataEvent(departmentId: 1501));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return BlocProvider(
      create: (_) => _onBoardingBloc,
      child: BlocBuilder<OnBoardingBloc, OnBoardingState>(
        builder: (context, state){
          if(state is OnBoardingLoaded){
            return Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.menu),
                        SizedBox(
                          height: _mediaQuery.size.height * 0.06,
                        ),
                        Text(
                          'Hola ${state.sessionData.fullname}',
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      color: AppColors.primaryColor,
                    ),
                    title: Text(
                      'Perfil',
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, Router.profileRoute);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 40.0, left: 70.0, bottom: 20.0),
                    child: Container(
                      height: 1,
                      width: 40,
                      color: AppColors.inputHintColor,
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      width: 20.0,
                      child: null,
                    ),
                    title: Text(
                      'Políticas de privacidad',
                      style: TextStyle(
                          color: AppColors.inputHintColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Container(
                      width: 20.0,
                      child: null,
                    ),
                    title: Text(
                      'Términos y condiciones',
                      style: TextStyle(
                          color: AppColors.inputHintColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Container(
                      width: 20.0,
                      child: null,
                    ),
                    title: Text(
                      'Ayuda',
                      style: TextStyle(
                          color: AppColors.inputHintColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, right: 40.0, left: 70.0),
                    child: Container(
                      height: 1,
                      width: 40,
                      color: AppColors.inputHintColor,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.exit_to_app,
                      color: AppColors.primaryColor,
                    ),
                    title: Text(
                      'Cerrar Sesión',
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            );
          } else {
            return Container(child: null,);
          }
        },
      ),
    );
  }
}
