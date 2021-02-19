import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_practice/constants.dart';
import 'package:flutter_app_practice/utills/alert_utill.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthScreen extends StatefulWidget {
  static final routeName = '/auth';
  final bool isLogin;

  AuthScreen(this.isLogin);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  final FirebaseAuth _auth=FirebaseAuth.instance;
  String email="";
  String password="";


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text(widget.isLogin ? 'Login': 'Register'),
      ),
      body: ProgressHUD(
        child: Builder(
          builder: (context) => Padding(
            padding:  EdgeInsets.all(kLargeMargin),
            child: Column(
              children: <Widget>[
                Flexible(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Hero(
                          tag: 'logo',
                          child: Image(
                            image: AssetImage('images/Logo.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: kSmallMargin,
                      ),
                      Expanded(
                        child: ScaleAnimatedTextKit(
                          repeatForever: true,
                          text: widget.isLogin ?
                          ["Let's", "Login",] :
                          ["Let's", "Register"],
                          textStyle: TextStyle(
                              fontSize: 50.0,
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
                  onChanged: (value){
                    email=value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    icon: Icon(Icons.alternate_email)
                  ),
                ),
                TextField(
                  onChanged: (value){
                    password=value;
                  },
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
                        child: Text(
                          widget.isLogin ? 'Login': 'Register',style: TextStyle(color: Colors.white),),
                        onPressed: () async {
                          final progress=ProgressHUD.of(context);
                          progress.showWithText(widget.isLogin ? 'Logging in' : 'Registering');
                          try{
                            await _auth.createUserWithEmailAndPassword(email: email, password: password);
                          }catch(e){
                            print(e);
                            AlertUtill.getErrorAlert(context, e.code).show();
                          }
                          progress.dismiss();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
