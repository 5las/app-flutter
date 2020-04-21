import 'package:app_5las/src/core/widgets/default_button.dart';
import 'package:app_5las/src/core/widgets/default_input_decoration.dart';
import 'package:app_5las/src/config/colors.dart';
import 'package:app_5las/src/core/widgets/progress_overlay.dart';
import 'package:app_5las/src/features/auth/presentation/bloc/login_bloc.dart';
import 'package:app_5las/src/commons/mixins/progress_overlay_mixin.dart';
import 'package:app_5las/src/features/onBoarding/presentation/widgets/districts_aux.dart';
import 'package:app_5las/src/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:app_5las/src/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  ProfileBloc _profileBloc;
  ProgressOverlay _progressOverlay;

  @override
  void initState() {
    _profileBloc = serviceLocator<ProfileBloc>();
    _profileBloc.add(ProfileDataEvent());
    _progressOverlay = ProgressOverlay();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppColors.white, statusBarBrightness: Brightness.dark));
    var _mediaQuery = MediaQuery.of(context);
    return BlocProvider(
      create: (_) => _profileBloc,
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state){
          if(state is ProfileLoaded){
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
                      child: buildProfile(context, _mediaQuery, state),
                    ),
                  ),
                ),
              ),
            );
          }else{
            return Container(child: null,);
          }
        },
      ),
    );
  }

  buildProfile(BuildContext context, MediaQueryData _mediaQuery, ProfileLoaded state ) {
    return  Column(
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
                hintText: '${state.sessionData.fullname}'),
            validator: (value){
              if(value.isEmpty){
                return 'Por favor complete este campo';
              }
              return null;
            },
          ),
        ),
        Container(
          height: 60.0,
          child: TextFormField(
            autofocus: false,
            style: TextStyle(fontSize: 22.0, color: AppColors.black),
            decoration: DefaultInputDecoration(
                hintText: 'DNI: ${state.sessionData.dni}'),
          ),
        ),
        Container(
          height: 60.0,
          child: TextFormField(
            autofocus: false,
            style: TextStyle(fontSize: 22.0, color: AppColors.black),
            decoration: DefaultInputDecoration(
                hintText: 'Dirección'
            ),
          ),
        ),
        Container(
          height: 60.0,
          child: TextFormField(
            autofocus: false,
            style: TextStyle(fontSize: 22.0, color: AppColors.black),
            decoration: DefaultInputDecoration(
                hintText: '${state.sessionData.district.name}'
            ),
          ),
        ),
        /*Container(
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
        ),*/
        SizedBox(
          height: _mediaQuery.size.height * 0.02,
        ),
        Container(
          height: 60.0,
          child: TextFormField(
            autofocus: false,
            style: TextStyle(fontSize: 22.0, color: AppColors.black),
            decoration: DefaultInputDecoration(
                hintText: '${state.sessionData.email}'),
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
    );
  }

}
