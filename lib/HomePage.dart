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