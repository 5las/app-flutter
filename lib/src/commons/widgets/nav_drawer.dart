import 'package:app_5las/src/config/colors.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
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
                  height: 60.0,
                ),
                Text(
                  'Hola Luis',
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),
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
                fontWeight: FontWeight.w500
              ),
            ),
            onTap: () => {},
          ),
          Padding(
            padding: const EdgeInsets.only(top:20.0,right: 40.0, left: 70.0, bottom: 20.0),
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
                  fontWeight: FontWeight.w500
              ),
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
                  fontWeight: FontWeight.w500
              ),
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
                  fontWeight: FontWeight.w500
              ),
            ),
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(top:20.0,right: 40.0, left: 70.0, bottom: 20.0),
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
                  fontWeight: FontWeight.w500
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
