import 'package:flutter/material.dart';

const kHeadingTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
);

const kWelcomeScreenButtonsText = TextStyle(
  fontSize: 20.0,
);

const kTitleNameStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
  color: Colors.orange,
);

const kTextFieldStyle = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
  icon: Icon(Icons.email,
      color: Colors.orange),
  filled: true,
  fillColor: Colors.white,
  hintText: '',
);

const kTextFieldChartBoxStyle = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0),
    ),
  ),
  hintText: "Write message...",
  hintStyle: TextStyle(color: Colors.black54),
);

const kCurrentUserBubbleStyle = BorderRadius.only(
  topLeft: Radius.circular(30.0),
  topRight: Radius.circular(30.0),
  bottomLeft: Radius.circular(30.0),
);

const kReceivingUserBubbleStyle = BorderRadius.only(
  topLeft: Radius.circular(30.0),
  topRight: Radius.circular(30.0),
  bottomRight: Radius.circular(30.0),
);