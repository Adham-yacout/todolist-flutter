
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/home/homescreen.dart';
import 'package:todolist/mytheme.dart';
import 'package:todolist/provider/listprovider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();
  runApp( ChangeNotifierProvider(
    create: (context)=>listprovider(),
      child: MyApp()));
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
