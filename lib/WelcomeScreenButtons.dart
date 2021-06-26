import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableElevatedButton extends StatelessWidget {
  ReusableElevatedButton({@required this.text, @required this.screen});

  final text;
  final screen;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        Navigator.pushNamed(context, screen);
      },
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(text,
          style: kWelcomeScreenButtonsText,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),),
        elevation: 5,
        primary: Colors.orange,
        onPrimary: Colors.white,
        shadowColor: Colors.blue,
      ),
    );
  }
}
