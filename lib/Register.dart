import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatbase/Login.dart';
import 'package:flutter_chatbase/constants.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'chart.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  static const String name = 'Register_Screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

   final _firebaseAuth = FirebaseAuth.instance;
   String email;
   String password;
   String confirmPassword;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ProgressHUD(
          child: Builder(
            builder: (context)=>Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Image(image: AssetImage('assets/lion.jfif'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child:
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Text('Register',
                            style: kHeadingTextStyle,
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: TextField(
                              onChanged: (value){
                                email = value;
                              },
                              decoration: kTextFieldStyle.copyWith(hintText: 'Enter Email'),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: TextField(
                              onChanged: (value){
                                password = value;
                              },
                              obscureText: true,
                              decoration: kTextFieldStyle.copyWith(hintText: 'Enter password', icon: Icon(Icons.enhanced_encryption, color: Colors.orange),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: TextField(
                              obscureText: true,
                              onChanged: (value){
                                confirmPassword = value;
                              },
                              decoration: kTextFieldStyle.copyWith(hintText: 'Confirm Password', icon: Icon(Icons.enhanced_encryption, color: Colors.orange),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          ConstrainedBox(
                            constraints: BoxConstraints.tightFor(height: 50, width: 200),
                            child: ElevatedButton(
                              onPressed: () async {
                                final progress = ProgressHUD.of(context);
                                setState(() {
                                  progress.show();
                                });
                                try{

                                    if(password == confirmPassword){
                                      final newUser = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
                                      if(newUser!= null){
                                        Navigator.pushNamed(context, ChatRoom.name);
                                      }
                                     }
                                    setState(() {
                                      progress.dismiss();
                                    });
                                }catch(e){
                                    print(e);
                                }

                              },

                              child: Text('Register'),
                              style: ElevatedButton.styleFrom(
                                shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                                elevation: 5,
                                primary: Colors.orange,
                                onPrimary: Colors.white,
                                shadowColor: Colors.blue,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Already have an Account'),
                                TextButton(onPressed: (){
                                  Navigator.pushNamed(context, MainContent.name);
                                }, child: Text(
                                    'Click Here'
                                ),
                                ),
                              ],
                            ),
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
    );;
  }
}




