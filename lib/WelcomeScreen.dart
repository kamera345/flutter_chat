import 'package:flutter/material.dart';
import 'package:flutter_chatbase/Login.dart';
import 'package:flutter_chatbase/Register.dart';
import 'WelcomeScreenButtons.dart';
import 'package:flutter_chatbase/constants.dart';

class WelcomeScreen extends StatelessWidget {


  static const String name = 'Welcome_Screen';


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.flash_auto,
                color: Colors.orange,
                size: 70.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text('Chit Chat',
                  style: kTitleNameStyle,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReusableElevatedButton(text: 'Login', screen: MainContent.name),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReusableElevatedButton(text: 'Register', screen: RegisterScreen.name),
            ),
          ],
          ),
        ),
      ),
    );
  }
}

