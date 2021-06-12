import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_practice/models/group.dart';

class ChatScreen extends StatefulWidget {

  static final String routeName='/chats';
  final Group group;

  ChatScreen(this.group);

  @override
  _ChatScreenState createState() => _ChatScreenState();


}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.group.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Expanded(child: Message)
        ],
      ),
    );
  }

}