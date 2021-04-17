import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_practice/models/group.dart';

import '../custom_list_tile.dart';

class GroupCard extends StatelessWidget{

  final Group group;

  GroupCard(this.group);
  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 3,
      child: CustomListTile(
        onTap: (){

        },
        title: Text(
          group.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          group.tagline,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        leading: CircleAvatar(
          child: ClipOval(
            child: CachedNetworkImage(
              height: 100,
              width: 100,
              fit: BoxFit.cover,
              imageUrl: group.imageUrl,
              placeholder: (context, url)=>CircularProgressIndicator(),
              errorWidget: (context,url,error)=>Icon(Icons.group),
            ),
          ),
        ),
      ),
    );
  }
  
}