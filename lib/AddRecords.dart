import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'package:api/MainDrawer.dart';

class AddRecords extends StatefulWidget {
  @override
  _AddRecordsState createState() => _AddRecordsState();
}

Future createRecord(
    String first, String last, String gndr, String eml, String phoneNum) async {
  final apiURL = Uri.parse('https://pcc.edu.pk/ws/create/ls_providers.php');

  final res = await http.post(apiURL,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*",
      },
      body: jsonEncode(<String, String>{
        "firstName": first,
        "lastName": last,
        "gender": gndr,
        "email": eml,
        "phone": phoneNum
      }));

  if (res.statusCode == 201) {
    print('success');
    return res;
  } else {
    print('fail');
    print(res);
    return null;
  }
}

class _AddRecordsState extends State<AddRecords> {
  String fName = "";
  String lName = "";
  String emailAdress = "";
  String sex = "";
  String phoneNum = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Records'),
        ),
        drawer: Drawer(
            child: ListView(children: [
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
        ])),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26, vertical: 6),
                  child: new TextField(
                    decoration: new InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'First Name',
                    ),
                    onChanged: (value) => {
                      fName = value,
                    },
                  ),
                )
              ]),
              Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26, vertical: 6),
                  child: new TextField(
                    decoration: new InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Last Name',
                    ),
                    onChanged: (value) => {
                      lName = value,
                    },
                  ),
                )
              ]),
              Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26, vertical: 6),
                  child: new TextField(
                    decoration: new InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Gender',
                    ),
                    onChanged: (value) => {
                      sex = value,
                    },
                  ),
                )
              ]),
              Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26, vertical: 6),
                  child: new TextField(
                    decoration: new InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Email',
                    ),
                    onChanged: (value) => {
                      emailAdress = value,
                    },
                  ),
                )
              ]),
              Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26, vertical: 6),
                  child: new TextField(
                    decoration: new InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Phone Number',
                    ),
                    onChanged: (value) => {
                      phoneNum = value,
                    },
                  ),
                )
              ]),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                    child: Text('Add Records'),
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                      elevation: 5,
                    ),
                    onPressed: () async {
                      final String first = fName;
                      final String last = lName;
                      final String gndr = sex;
                      final String eml = emailAdress;
                      final String number = phoneNum;

                      final record =
                          await createRecord(first, last, gndr, eml, number);

                      
                      return showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoAlertDialog(
                              title: Text('Record added Successfully',
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 24,
                                  )),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Ok'))
                              ],
                            );
                          });
                    }),
              )
            ]));
  }
}
