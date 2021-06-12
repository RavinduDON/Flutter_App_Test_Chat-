
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_practice/models/group.dart';

class MessageStream extends StatelessWidget {
  FirebaseFirestore _firestore =  FirebaseFirestore.instance;
  final Group group;

  MessageStream(this.group);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _firestore
            .collection('messages')
            .where('groupId', isEqualTo: group.id)
            .orderBy('timeStamp')
            .snapshots(),
      builder: (context, snapshot) {
          if(!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          final messages = snapshot.data.documents.reserved;

      },
    );
  }

}