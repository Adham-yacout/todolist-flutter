import 'package:flutter/material.dart';
import 'package:todolist/home/homescreen.dart';
import 'package:todolist/mytheme.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,

      routes:{ homescreen.routename:(context) => homescreen()},
      initialRoute: homescreen.routename,
theme: Mythemdata.lightTheme,
    );
  }
}
