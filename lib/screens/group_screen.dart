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
  Stream<QuerySnapshot> _firestore=FirebaseFirestore.instance.collection('groups').snapshots();
  Stream collectionStream=FirebaseFirestore.instance.collection('groups').snapshots();
  @override
  Widget build(BuildContext context) {
    CollectionReference groups=FirebaseFirestore.instance.collection('groups');
    return Scaffold(
      appBar: AppBar(
        title: Text('Groups'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: groups.snapshots(),
        builder: (BuildContext context,AsyncSnapshot <QuerySnapshot> snapshot){
          if(!snapshot.hasData) {
            return CircularProgressIndicator(
              backgroundColor: Theme
                  .of(context)
                  .accentColor,
            );
          }
          // final groups=snapshot.data.;
          // List<GroupCard> groupCards=[];
          // for(var group in groups){
          //   groupCards.add(GroupCard(Group(
          //     id:group.documentID,
          //     name:group.data['name'],
          //     tagline:group.data['tagline'],
          //     imageUrl:group.data['imageUrl']
          //   )));
          // }
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: kSmallMargin,vertical: kLargeMargin),
            children: snapshot.data.docs.map((DocumentSnapshot document){
              return new GroupCard(Group(
              id: document.id,
              name: document.data()['name'],
              tagline: document.data()['tagline'],
              imageUrl: document.data()['imageUrl']
              ));
          }).toList(),
          );
        },
      ),
    );
  }

}