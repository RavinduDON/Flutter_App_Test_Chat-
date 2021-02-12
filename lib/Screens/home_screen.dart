import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_practice/Screens/auth_screen.dart';
import 'package:flutter_app_practice/constants.dart';

class HomeScreen extends StatefulWidget {
  static final String routename = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Alfa Chat'),
      ),
      body: Padding(
        padding: EdgeInsets.all(kLargeMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Image(
                height: 250,
                image: AssetImage('images/Logo.png'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 10.0),
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
              onPressed: (){
                Navigator.pushNamed(context, AuthScreen.routeName,arguments: true);
              },
            ),
            OutlineButton(
              color: Theme.of(context).accentColor,
              splashColor: Theme.of(context).accentColor,
              borderSide: BorderSide(
                color: Theme.of(context).primaryColorDark
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
