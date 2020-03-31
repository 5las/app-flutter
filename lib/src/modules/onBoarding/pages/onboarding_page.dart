import 'package:app_5las/src/commons/widgets/default_button.dart';
import 'package:app_5las/src/config/colors.dart';
import 'package:app_5las/src/config/colors.dart';
import 'package:app_5las/src/modules/onBoarding/widgets/departments_aux.dart';
import 'package:app_5las/src/modules/onBoarding/widgets/districts_aux.dart';
import 'package:app_5las/src/modules/onBoarding/widgets/establishment_aux.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

List cardSlider = [1,2,3];

class _OnBoardingPageState extends State<OnBoardingPage> {

  @override
  Widget build(BuildContext context) {

    FlutterStatusbarcolor.setStatusBarColor(AppColors.primaryColor);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Column(
          children: <Widget>[
            Text(
              'Luis Delgado',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
                'Lima - Barranco',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 19.0,
                fontWeight: FontWeight.w500
              ),
            ),
          ],
        ),
        elevation: 0.0,
        leading: Icon(
            Icons.menu,
          color: AppColors.white,
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 22.0,
            ),
            Text(
                '¿Dónde quieres comprar?',
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            Text(
              "Departamento/Provincia* ",
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600
              ),
            ),
        Container(
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
            child: DropDownDepartments(),
          ),
        ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              "Distrito* ",
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600
              ),
            ),
            Container(
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
              height: 16.0,
            ),
            Text(
              "Elija un establecimiento* ",
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600
              ),
            ),
            Container(
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
                child: DropDownEstablishment(),
              ),
            ),
            SizedBox(
              height: 18.0,
            ),
        Container(
          child:  cardsSlider()
        ),
            SizedBox(
              height: 18.0,
            ),
            DefaultButton(
              backgroundColor: AppColors.primaryColor,
              textColor: AppColors.white,
              text: 'ELEGIR HORARIO',
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoardingPage()));
              },
            ),
          ],
        ),
      ),
    );
  }


  Widget cardsSlider() {
    final basicSlider = CarouselSlider(
      autoPlay: false,
      enableInfiniteScroll: false,
      height: 150.0,
      reverse: false,
      enlargeCenterPage: true,
      viewportFraction: 1.0,
      aspectRatio: 2.0,
      initialPage: 2,
      items: cardSlider.map((i) {
            return Builder(
                builder: (BuildContext context) {
                  return Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.backgroundColorComboBox,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(20.0),
                            topRight: const Radius.circular(20.0),
                            bottomLeft: const Radius.circular(20.0),
                            bottomRight: const Radius.circular(20.0),
                          ),
                        ),
                        width: MediaQuery.of(context)
                            .size
                            .width *
                            0.9,
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:30.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 48.0,
                                child: Container(
                                  child: null,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.all(6.0),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .center,
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                                children: <Widget>[
                                  Container(
                                    constraints:
                                    new BoxConstraints(
                                      maxWidth: MediaQuery.of(
                                          context)
                                          .size
                                          .width *
                                          0.5,
                                    ),
                                    child: Padding(
                                      padding:
                                      const EdgeInsets
                                          .only(
                                          top: 4.0,
                                          bottom: 8),
                                      child: Text(
                                        'Av. Grau 513',
                                        softWrap: true,
                                        overflow: TextOverflow.visible,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    constraints: new BoxConstraints(
                                        maxWidth: MediaQuery.of(
                                            context)
                                            .size
                                            .width *
                                            0.5),
                                    child: Padding(
                                      padding:
                                      const EdgeInsets
                                          .only(
                                          top: 4.0),
                                      child: Text(
                                        '(511)613 8888',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            height: 0.3),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0.0,
                        right: 0.0,
                        child: Container(
                          width: 100.0,
                          height: 36.0,
                          alignment: Alignment.topRight,
                          decoration: BoxDecoration(
                              color: AppColors.segmentNotice,
                              borderRadius:
                              BorderRadius.only(
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                bottomLeft: Radius.circular(12.0),
                              )
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 2, right: 2),
                            child: Center(child:FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text('Abierto',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16.0, color: AppColors.white)
                              ),
                            ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 20.0,
                        bottom: 10.0,
                        child: GestureDetector(
                          onTap: (){
                          },
                          child: Container(
                            child: Text(
                              'Ver Mapa',
                              style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                });
          }).toList(),

    );
    return Stack(
        children: [
      basicSlider,
      Positioned(
        top: 30.0,
        left: -16.0,
        child: GestureDetector(
          onTap: (){
            basicSlider.previousPage(
                duration: Duration(milliseconds: 300), curve: Curves.linear);
          },
          child: Padding(
            padding: const EdgeInsets.only(top:12.0),
            child: Container(
              height: MediaQuery.of(context).size.width * 0.18,
              width: 60.0,
              color: Colors.transparent,
              child: Icon(
                Icons.keyboard_arrow_left,
                size: 70.0,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ),
      Positioned(
        top: 30.0,
        right: -6.0,
        child: GestureDetector(
          onTap: (){
            basicSlider.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.linear);
          },
          child: Padding(
            padding: const EdgeInsets.only(top:12.0),
            child: Container(
              alignment: Alignment.centerRight,
              height: MediaQuery.of(context).size.width * 0.18,
              width: 60.0,
              color: Colors.transparent,
              child: Icon(
                Icons.keyboard_arrow_right,
                size: 70.0,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
