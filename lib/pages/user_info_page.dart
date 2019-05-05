import 'package:flutter/material.dart';
import 'package:dscsrmapp/main.dart';

//TODO: stay consistent with current dark/light mode selection.
class UserInfo extends StatelessWidget{
  Widget build(context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("User Account Information")
        ),
        body: Column(
          children: <Widget>[
            Row(children: <Widget>[
              CircleAvatar(radius: 50.00),
            ],
            ),

            RaisedButton(
                child: Text("Attended events"),
                onPressed: (){} //TODO: popup dialog/navigate to page showing past events
                ,)
          ],
        )
      )
    );
  }
}