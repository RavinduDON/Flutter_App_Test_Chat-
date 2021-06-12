import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_practice/Screens/auth_screen.dart';
import 'package:flutter_app_practice/Screens/home_screen.dart';
import 'package:flutter_app_practice/screens/chat_screen.dart';
import 'package:flutter_app_practice/screens/group_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      initialRoute: HomeScreen.routename,
      onGenerateRoute: (RouteSettings settings){
        var routes=<String, WidgetBuilder>{
          HomeScreen.routename:(context)=>HomeScreen(),
          AuthScreen.routeName:(context)=>AuthScreen(settings.arguments),
          GroupScreen.routeName:(context)=>GroupScreen(),
          ChatScreen.routeName:(context)=>ChatScreen(settings.arguments),
        };
        WidgetBuilder builder=routes[settings.name];
        return MaterialPageRoute(builder: (ctx)=>builder(ctx));
      },
      theme: ThemeData(
        primaryColor: Colors.cyan,
        primaryColorDark: Colors.cyan[700],
        primaryColorLight: Colors.cyan[200],
        accentColor: Colors.lightGreenAccent
      ),
    );
  }

}
