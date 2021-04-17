import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_practice/constants.dart';
import 'package:flutter_app_practice/screens/group_screen.dart';
import 'package:flutter_app_practice/utills/alert_utills.dart';
import 'package:flutter_app_practice/utills/auth_utils.dart';
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
                          bool isAuthSuccess;
                          if(widget.isLogin){
                            isAuthSuccess=await loginUser(context);
                          }else {
                            isAuthSuccess=await registerUser(context);
                          }
                          progress.dismiss();
                          AuthUtils.firebaseUser=await _auth.currentUser;
                          if(isAuthSuccess){
                            Navigator.pushNamed(context, GroupScreen.routeName);
                          }
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

  Future loginUser(BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print('Login Success');
      return true;
    }catch(e){
      print(e);
      AlertUtills.getErrorAlert(context, e.code).show();
      return false;
    }
  }

  Future registerUser(BuildContext context) async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      Navigator.pop(context);
      print('Register Success');
      return true;
    }catch(e){
      print(e);
      AlertUtills.getErrorAlert(context, e.code).show();
      return false;
    }
  }
}
