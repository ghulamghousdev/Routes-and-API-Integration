
import 'package:flutter/material.dart';
final drawerpanel = DrawerHeader(
 child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(
        radius: 40,
        backgroundColor: Colors.white,
        backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/52177956?s=400&u=50695523c444121c97674ddbf79570b83d0948c7&v=4"),
      ),
      SizedBox(
        height: 19,
      ),
      Text(
        'Ghulam Ghous',
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
      Text(
        'itsghulamghous@gmail.com',
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
    ],
  ),
  decoration: BoxDecoration(color: Colors.lightBlue),
);