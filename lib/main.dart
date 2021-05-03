import 'package:flutter/material.dart';
import 'MainDrawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          
          title: Text("Video Call Buddies"),
        ),
        drawer: Drawer(
          child: MainDrawer(),
        ),
        //Now we are going to open a new file
        // where we will create the layout of the Drawer
      
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _hommies("Tayyab Lalazai", "https://bit.ly/3tz4NLw",
                      "Hola buddies, I know it's tough going for you guys out there in Covid days but don't you dare to worry. You have have your's Tayyab Lalazai Sulmaniya Dua Khany waly"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _hommies("Dawood Malhi", "https://bit.ly/3srlqr6",
                      "Graphic Designer | Photographer | Student of Computer Science"),
                  _hommies("Ghulam Ghous", "https://bit.ly/3tzMLZo",
                      "Hey, How you doing?"),     
                ], 
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _hommies("Krona Emmanuel", "https://bit.ly/3v4LZEg",
                      "ambitious young programmer ....."),
                  _hommies("Abdullah Saleem", "https://bit.ly/3anUnH8",
                      "AB Studios"),
                ],
              )
            ]));
  }

  Widget _hommies(final String name, String imgUrl, String description) {
    return Container(
      width: 160,
      height: 160,
      margin: EdgeInsets.only(
        top: 30,
        left: 10,
        right: 10,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17.0),
        ),
        color: Colors.white,
        elevation: 10,
        shadowColor: Colors.blue,
        child: InkWell(
          onTap: () {
            showAlertDialog(context, name, description);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  height: 85,
                  width: 85,
                  margin: EdgeInsets.only(
                    top: 11,
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(imgUrl),
                        fit: BoxFit.cover,
                      ))),
              ListTile(
                title: Center(
                    child: Text(name,
                        style: TextStyle(
                          fontSize: 14,
                        ))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, String name, String description) {
    // Create button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(name),
      content: Text(description),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}