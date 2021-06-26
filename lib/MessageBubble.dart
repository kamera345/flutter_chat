import 'package:flutter/material.dart';
import 'constants.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({this.text, this.sender, this.myId});
  final text;
  final sender;
  final bool myId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: myId ? CrossAxisAlignment.end: CrossAxisAlignment.start,
        children: [
          Text(sender,
            style: TextStyle(
              color: Colors.black54,
            ),),
          SizedBox(height: 3),
          Material(
            elevation: 5,
            borderRadius: myId ? kCurrentUserBubbleStyle : kReceivingUserBubbleStyle,
            color: myId ? Colors.blue[400]: Colors.blue[100],
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(text,
                style: TextStyle(
                  fontSize: 16.0,
                  color: myId ? Colors.white: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
