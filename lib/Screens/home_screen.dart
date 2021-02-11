import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_practice/constants.dart';

class LoginScreen extends StatefulWidget {
  static final String routename = '/';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Alfa Chat'),
      ),
      body: Padding(
        padding: EdgeInsets.all(kLargeMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image(
              height: 250,
              image: AssetImage('images/Logo.png'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0),
                    child: Text(
                      "Chat with your, ",
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
                ),
                SizedBox(
                  width: kSmallMargin,
                ),
                Expanded(
                  child: RotateAnimatedTextKit(
                      repeatForever: true,
                      text: ["Friends", "Relations", "Lovers"],
                      textStyle: TextStyle(fontSize: 40.0, fontFamily: "Horizon"),

                  ),
                ),
              ],
            ),
            FlatButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: (){},
            ),
            OutlineButton(
              color: Theme.of(context).accentColor,
              splashColor: Theme.of(context).accentColor,
              borderSide: BorderSide(
                color: Theme.of(context).accentColor
              ),
              onPressed: (){},
              child: Text('Sign Up'),
            ),

          ],
        ),
      ),
    );
  }
}
