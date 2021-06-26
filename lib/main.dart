import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatbase/Register.dart';
import 'Login.dart';
import 'WelcomeScreen.dart';
import 'chart.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.name,
      routes: {
        WelcomeScreen.name: (context)=>WelcomeScreen(),
        MainContent.name: (context)=>MainContent(),
        RegisterScreen.name:(context)=>RegisterScreen(),
        ChatRoom.name: (context)=>ChatRoom(),
      },
    );
  }
}

