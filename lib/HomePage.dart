import 'package:flutter/material.dart';
import 'MainDrawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(    
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            drawerpanel,
          ListTile(
          leading: Icon(Icons.person),
          title: Text('HomePage',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              )),
              onTap: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
          ),
      ListTile(
          leading: Icon(Icons.person),
          title: Text('Add Records',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              )),
          onTap: () {
                Navigator.popAndPushNamed(context, '/addrecords');
              },
          ),
      ListTile(
        leading: Icon(Icons.article),
        title: Text('View Records',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            )),
            onTap: () {
                Navigator.popAndPushNamed(context, '/viewrecords');
              },
      ),
          ]
          )
          ),
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image(image: NetworkImage("https://camo.githubusercontent.com/9b239b9541504aa3903d695155eb48db994437e8855c439c6f1f08b789e14d35/68747470733a2f2f6f63746f6465782e6769746875622e636f6d2f696d616765732f76696e796c746f6361742e706e67")),
                 
            Text(
              'User Management Portal',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            )
          ],
        ),
      )),
    );
  }
}