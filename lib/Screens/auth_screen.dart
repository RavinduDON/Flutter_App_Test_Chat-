import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_practice/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthScreen extends StatefulWidget {
  static final routeName = '/auth';
  final bool isLogin;

  AuthScreen(this.isLogin);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding:  EdgeInsets.all(kLargeMargin),
        child: Column(
          children: <Widget>[
            Flexible(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Image(
                      image: AssetImage('images/Logo.png'),
                    ),
                  ),
                  SizedBox(
                    width: kSmallMargin,
                  ),
                  Expanded(
                    child: ScaleAnimatedTextKit(
                      repeatForever: true,
                      text: [
                        "Let's",
                        "Login",
                      ],
                      textStyle: TextStyle(
                          fontSize: 70.0,
                          color: Colors.black
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: kLargeMargin,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email',
                icon: Icon(Icons.alternate_email)
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                icon: Icon(FontAwesomeIcons.userLock),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    color: Theme.of(context).primaryColor,
                    splashColor: Theme.of(context).accentColor,
                    child: Text('Login',style: TextStyle(color: Colors.white),),
                    onPressed: (){},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
