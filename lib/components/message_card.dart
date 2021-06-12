import 'package:flutter/cupertino.dart';
import 'package:flutter_app_practice/constants.dart';
import 'package:flutter_app_practice/models/message.dart';
import 'package:flutter_app_practice/utills/auth_utils.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  final Message message;

  MessageCard(this.message);

  @override
  Widget build(BuildContext context) {
    bool isMe = AuthUtils.firebaseUser.email == message.sender;
    TextStyle textStyle = TextStyle(color: isMe ? Colors.white : Colors.black);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: kSmallMargin / 2),

    );
  }
}
