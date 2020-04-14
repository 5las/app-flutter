import 'package:app_5las/src/config/routes.dart';
import 'package:app_5las/src/core/widgets/default_button.dart';
import 'package:app_5las/src/core/widgets/default_input_decoration.dart';
import 'package:app_5las/src/config/colors.dart';
import 'package:app_5las/src/core/widgets/password_decoration.dart';
import 'package:app_5las/src/core/widgets/shadowed_container.dart';
import 'package:app_5las/src/features/auth/presentation/bloc/login_bloc.dart';
import 'package:app_5las/src/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  AuthBloc _authBloc;
  bool _obscureText = true;

  var _loginKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppColors.white, statusBarBrightness: Brightness.dark));
    _authBloc = serviceLocator<AuthBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          statusBarIconBrightness: Brightness.dark // transparent status bar
      ),
      child: BlocProvider(
        create: (_) => _authBloc,
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(_mediaQuery.size.width * 0.05),
              child: SingleChildScrollView(
                child: buildSignIn(context, _mediaQuery),
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildSignIn(BuildContext context, MediaQueryData _mediaQuery) {
    return  BlocListener<AuthBloc,AuthState>(
      listener: (context,state){
        if(state is LoginFailure){
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: AppColors.primaryColor,
            ),
          );
        }
        else if(state is LoginLoaded){
          Navigator.of(context).pushNamed(Router.onBoardingRoute);
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state){
          return Form(
            key: _loginKey,
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
                  height: 80.0,
                  child: TextFormField(
                    autofocus: false,
                    style: TextStyle(fontSize: 22.0, color: AppColors.black),
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: DefaultInputDecoration(
                        hintText: 'Correo',
                        suffixIconData: Icons.person),
                    validator: (emailValue){
                      if(!emailValue.contains('@')){
                        return 'Por favor verifique su correo';
                      }else{
                        return null;
                      }
                    },
                  ),
                ),
                Container(
                  height: 80.0,
                  child: TextFormField(
                    autofocus: false,
                    style: TextStyle(fontSize: 22.0, color: AppColors.black),
                    obscureText: _obscureText,
                    controller: _passwordController,
                    validator: (passwordValue) {
                      if(passwordValue.isEmpty && passwordValue.length < 6){
                        return 'Por favor verifique su contraseña';
                      }else {
                        return null;
                      }
                    },
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
                    child: (state is LoginLoading)
                        ?DefaultButton(
                      backgroundColor: AppColors.primaryColor,
                      widget:  Center(
                       child: SizedBox(
                              height: 22,
                              width: 22,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(
                                    AppColors.white),
                              ))
                      ),
                      onPressed: (){
                      },
                    ) :
                    DefaultButton(
                      backgroundColor: AppColors.primaryColor,
                      textColor: AppColors.white,
                      text: 'INGRESAR',
                      onPressed: (){
                        final isValid = _loginKey.currentState.validate();
                        if(isValid){
                          state is! LoginLoading ? BlocProvider.of<AuthBloc>(context).add(
                              LoggedIn(_emailController.text,_passwordController.text)):null;
                        }
                      },
                    )
                ),
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
                    Navigator.of(context).pushNamed(Router.signUpRoute);
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
          );
        },
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

}
