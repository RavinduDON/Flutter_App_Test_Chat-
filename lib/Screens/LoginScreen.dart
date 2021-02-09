import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image(
            height: 250,
            image: AssetImage('images/Logo.png'),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(width: 20.0, height: 100.0),
              Text(
                "Lets Chat, ",
                style: TextStyle(fontSize: 43.0),
              ),
              SizedBox(width: 20.0, height: 100.0),
              RotateAnimatedTextKit(
                  onTap: () {
                    print("Tap Event");
                  },
                  text: ["Friends", "Relations", "Lovers"],
                  textStyle: TextStyle(fontSize: 40.0, fontFamily: "Horizon"),
                  textAlign: TextAlign.start),
            ],
          )
        ],
      ),
    );
  }
}
