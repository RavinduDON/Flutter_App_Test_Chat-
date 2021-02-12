import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget{

  static final routeName='/auth';
  final bool isLogin;


  AuthScreen(this.isLogin);

  @override
  _AuthScreenState createState() => _AuthScreenState();


}
class _AuthScreenState extends State<AuthScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
    );
  }
  
}