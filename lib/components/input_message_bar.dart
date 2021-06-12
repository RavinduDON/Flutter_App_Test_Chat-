
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_practice/constants.dart';
import 'package:flutter_app_practice/models/group.dart';
import 'package:flutter_app_practice/utills/auth_utils.dart';

class InputMessageBar extends StatefulWidget {

  final Group group;
  InputMessageBar(this.group);
  @override
  _InputMessageBarState createState() => _InputMessageBarState();

}

class _InputMessageBarState extends State<InputMessageBar> {

  FirebaseFirestore _firestore=FirebaseFirestore.instance;
  String message='';
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: TextField(
          maxLines: null,
          keyboardType: TextInputType.multiline,
          textCapitalization: TextCapitalization.sentences,
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColorDark
              )
            )
          ),
          onChanged: (value) {
            message =  value.trim();
          },
          onSubmitted: (value) {
            addMessage();
            controller.clear();
          },
        )),
        SizedBox(
          width: kLargeMargin,
        )
      ],
    );
  }

  Future<DocumentReference> addMessage() {
    return _firestore.collection('messages').add({
      'groupId': widget.group.id,
      'message': message,
      'sender': AuthUtils.firebaseUser.email,
      'timeStamp': Timestamp.now()
    });
  }

}