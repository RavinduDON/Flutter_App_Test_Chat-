import 'package:flutter/material.dart';
import 'package:flutter_app_practice/Screens/LoginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      initialRoute: LoginScreen.routename,
      routes: {
        LoginScreen.routename:(context)=>LoginScreen()
      },
      theme: ThemeData(
        primaryColor: Colors.cyan,
        primaryColorDark: Colors.cyan[700],
        accentColor: Colors.lightGreenAccent
      ),
    );
  }

}
