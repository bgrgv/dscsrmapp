import 'package:dscsrmapp/pages/userinfopage/username_change_dialog.dart';
import 'package:flutter/material.dart';
import 'package:dscsrmapp/main.dart';
import 'package:dscsrmapp/services/authentication.dart';
import 'package:dscsrmapp/pages/userinfopage/password_change_dialog.dart';

//TODO: change all hardcoded edgeinset values to percentages of device height/width (get with MediaQuery)
//TODO: implement filepicker for changing user avatar

class UserInfoPage extends StatefulWidget{
  UserInfoPage({this.auth});

  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new UserInfoPageState();
}

 class UserInfoPageState extends State<UserInfoPage>{

   BuildContext scaffoldContext;
   String _userName = "";
   String _userEmail = "";
   //String _userPassword = "";

   
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

  void showUpdatedValueSnackBar(String msg) {
      Scaffold.of(scaffoldContext).showSnackBar(
        new SnackBar(
          content: new Text(msg),
          duration: new Duration(seconds: 2),
        )
      );
    }
  

  Widget build(BuildContext context){
    Widget body = Padding(
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
                child: Text("$_userName", textScaleFactor: 2.0,),
                )
              ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
              child: FlatButton(
                child: Text("Change username?"),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Theme(
                        data: darkTheme ? ThemeData.dark() : ThemeData.light(),
                        child: ChangeUsernameDialog(displaySnackBar: showUpdatedValueSnackBar, auth: widget.auth),
                  );
                  });
                    }
                  ),
                ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Text("$_userEmail", textScaleFactor: 2.0,),
                )
              ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: FlatButton(
                child: Text("Change password?"),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Theme(
                        data: darkTheme ? ThemeData.dark() : ThemeData.light(),
                        child: ChangePasswordDialog(displaySnackBar: showUpdatedValueSnackBar, auth: widget.auth),
                  );
                  });
                    }
                  ),
                ), 
              new Expanded(
                child: new Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    child: const Text("Attended events"),
                    onPressed: (){} //TODO: popup dialog/navigate to page showing past events
                  ),
                ),
              ),         
            ],
          )
        );

    return MaterialApp(
      theme: darkTheme ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Account Information")
        ),
        body: new Builder(
          builder: (BuildContext context) {
            scaffoldContext = context;
            return body;
            }, 
          )
      )
    );

  }
}