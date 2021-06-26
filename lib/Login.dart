import 'package:flutter/material.dart';
import 'package:flutter_chatbase/Register.dart';
import 'package:flutter_chatbase/chart.dart';
import 'package:flutter_chatbase/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class MainContent extends StatefulWidget {

  static const String name = 'Login_Screen';

  @override
  _MainContentState createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  final _firebaseAuth = FirebaseAuth.instance;
  String email;
  String password;
  final fieldText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ProgressHUD(
          child: Builder(
            builder: (context)=> Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Image(
                      image: AssetImage('assets/lion.jfif'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Text('Login',
                            style: kHeadingTextStyle,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (value){
                                email = value;
                              },
                              decoration: kTextFieldStyle.copyWith(hintText: 'Enter Email'),
                            ),
                          ),
                          SizedBox(height: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (value){
                                password = value;
                              },
                              obscureText: true,
                              decoration: kTextFieldStyle.copyWith(hintText: 'Enter Password', icon: Icon(Icons.enhanced_encryption, color: Colors.orange),),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          ConstrainedBox(
                            constraints: BoxConstraints.tightFor(width: 200, height: 40),
                            child: ElevatedButton(
                              child: Text('Login'),
                              onPressed: () async {
                                final progress = ProgressHUD.of(context);
                                setState(() {
                                  progress.show();
                                });
                                try{
                                  final user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
                                  if(user != null){
                                    Navigator.pushNamed(context, ChatRoom.name);
                                  }
                                  setState(() {
                                    progress.dismiss();
                                  });
                                }catch(e){
                                  print(e);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),
                                ),
                                primary: Colors.orange,
                                elevation: 5,
                                onPrimary: Colors.white,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text('Register Account'),
                              ),
                              TextButton(onPressed: (){
                                Navigator.pushNamed(context, RegisterScreen.name);
                              }, child: Text('Sign Up'),),
                              TextButton(
                                onPressed: (){
                                },
                                child: Text('Forget Password'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
