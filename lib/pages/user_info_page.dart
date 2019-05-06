import 'package:flutter/material.dart';
import 'package:dscsrmapp/main.dart';
import 'package:dscsrmapp/services/authentication.dart';

//TODO: stay consistent with current dark/light mode selection.
//TODO: change all hardcoded edgeinset values to percetages of device height/width (get with MediaQuery)

class UserInfoPage extends StatefulWidget{
  UserInfoPage({this.auth});

  final BaseAuth auth;
  
  @override
  State<StatefulWidget> createState() => new _UserInfoPageState();
}

 class _UserInfoPageState extends State<UserInfoPage>{

   String _userName = "";
   String _userEmail = "";

   @override
   void initState(){
     super.initState();
     widget.auth.getCurrentUser().then((user) {
       setState(() {
         if(user!=null)
         {
           _userEmail = user?.email;
           _userName = user?.displayName;
         }
       });
     });
   }
  Widget build(context){

    return MaterialApp(
      theme: darkTheme ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("User Account Information")
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: CircleAvatar(radius: 60.0),
                ),
              ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Text("$_userName"),
                )
              ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Text("$_userEmail"),
                )
              ),          
            RaisedButton(
                child: Text("Attended events"),
                onPressed: (){} //TODO: popup dialog/navigate to page showing past events
                ,)
            ],
          )
        )
      )
    );
  }
}