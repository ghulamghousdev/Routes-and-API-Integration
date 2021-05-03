import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        color: Theme.of(context).primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://avatars.githubusercontent.com/u/52177956?s=400&u=50695523c444121c97674ddbf79570b83d0948c7&v=4'),
                      fit: BoxFit.fill,
                    ))),
            Text('Ghulam Ghous',
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.white,
                )),
            Text('itsghulamghous@gmail.com',
                style: TextStyle(
                  color: Colors.white,
                ))
          ],
        ),
      ),
      ListTile(
        leading: Icon(Icons.person),
        title: Text('Add Records',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            )),
        onTap: null,
      ),
      ListTile(
        leading: Icon(Icons.article),
        title: Text('View Records',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            )),
      ),
  
    ]);
  }
}
