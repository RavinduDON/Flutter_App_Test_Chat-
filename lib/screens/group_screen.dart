import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_practice/components/group_card.dart';
import 'package:flutter_app_practice/constants.dart';
import 'package:flutter_app_practice/models/group.dart';



class GroupScreen extends StatefulWidget{
  static final String routeName = '/groups';
  @override
  _GroupScreenState createState() => _GroupScreenState();

}

class _GroupScreenState extends State<GroupScreen>{
  FirebaseFirestore _firestore=FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Groups'),
      ),
      body: StreamBuilder(
        stream: _firestore.collection('groups').snapshots(),
        builder: (context,snapshot){
          if(!snapshot.hasData) {
            return CircularProgressIndicator(
              backgroundColor: Theme
                  .of(context)
                  .accentColor,
            );
          }
          final groups=snapshot.data.documents;
          List<GroupCard> groupCards=[];
          for(var group in groups){
            groupCards.add(GroupCard(Group(
              id:group.documentID,
              name:group.data['name'],
              tagline:group.data['tagline'],
              imageUrl:group.data['imageUrl']
            )));
          }
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: kSmallMargin,vertical: kLargeMargin),
            children: groupCards,
          );
        },
      ),
    );
  }

}