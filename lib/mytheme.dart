import 'dart:ui';
import 'package:flutter/material.dart';
class Mythemdata{
  static Color primarylight=Color(0xff5D9CEC);
  static Color whitecolor=Colors.white;
  static Color greenlight=Color(0xff61E757);
  static Color redlight=Color(0xffEC4B4B);
  static Color backgroundlightcolor=Color(0xffd2f1cb);
  static Color blacklight=Color(0xff363636);
  static Color greylight=Color(0xffC8C9CB);
  static Color primarydarkcolor=Color(0xff060E1E);

 static ThemeData lightTheme =ThemeData(
   primaryColor: primarylight,
   primaryTextTheme:  TextTheme(
     displayLarge: TextStyle(
       fontSize: 22,
       fontWeight: FontWeight.bold,
       color: whitecolor
     ) ,
     titleMedium: TextStyle(
       fontSize: 18,
       fontWeight: FontWeight.bold,
       color: blacklight
     ),
     displaySmall: TextStyle(
         fontSize: 18,
         fontWeight: FontWeight.bold,
         color: primarylight
     ),
   ),
   appBarTheme: AppBarTheme(
     backgroundColor: primarylight,
     elevation: 0

   ),
   scaffoldBackgroundColor: backgroundlightcolor,
   floatingActionButtonTheme: FloatingActionButtonThemeData(
     backgroundColor: primarylight
   ),
   bottomNavigationBarTheme: BottomNavigationBarThemeData(
     selectedItemColor:primarylight,
     unselectedItemColor:greylight,
     backgroundColor: Colors.transparent,
     elevation: 0
   )
 );


}