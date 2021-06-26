import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chatbase/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'MessageBubble.dart';

final _firestore = FirebaseFirestore.instance;
User _userLogged;

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key key}) : super(key: key);

  static const String name = 'ChatScreen';

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  String msgText;
  final _firebaseAuth = FirebaseAuth.instance;
  final messageTextController = TextEditingController();


  void getUser() {
    try{
      final user =  _firebaseAuth.currentUser;

      if( user  != null){
        _userLogged = user;

        print(_userLogged.email);
      }
    }catch(e){
      print(e);
    }

  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChitChat'),
        backgroundColor: Colors.orange,
        actions: <Widget>[
          IconButton(
            onPressed: (){
              _firebaseAuth.signOut();
              Navigator.pop(context);
            },
            icon: Icon(Icons.logout,
            color: Colors.white,
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          MessageStream(),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  RawMaterialButton(
                      onPressed: (){
                      },
                    shape: CircleBorder(),
                    constraints: BoxConstraints(minWidth: 30.0, minHeight: 30.0),
                    fillColor: Colors.blueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value){
                        msgText = value;
                      },
                      decoration: kTextFieldChartBoxStyle,
                    ),
                  ),
                  SizedBox(width: 10),
                  FloatingActionButton(
                    onPressed: (){
                      messageTextController.clear();
                      _firestore.collection('messages').add(
                        {
                          'sender': _userLogged.email,
                          'text': msgText,
                        });
                    },
                    child: Icon(Icons.send,color: Colors.white,size: 18,),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  const MessageStream({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(stream: _firestore.collection('messages').snapshots(), builder: (context, snapshot){

      if(!snapshot.hasData){
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      List<MessageBubble> listview = [];

      final messages = snapshot.data.docs.reversed;
      for(var message in messages){
        final messageText = message['text'];
        final messageSender = message['sender'];

        final currentUser = _userLogged.email;

        final messageWidget = MessageBubble(text: messageText, sender: messageSender, myId: currentUser == messageSender);

        listview.add(messageWidget);

      }

      return Expanded(
        child: Container(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.only(right: 10.0, top: 7.0),
            children: listview,
          ),
        ),
      );
    });
  }
}





