import 'package:flutter/material.dart';
import 'package:dscsrmapp/services/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangeUsernameDialog extends StatefulWidget{
  final void Function(String) displaySnackBar;

  ChangeUsernameDialog({Key key, @required this.displaySnackBar, this.auth}) : super(key: key);

  final BaseAuth auth;

  @override
  ChangeUsernameDialogState createState() => new ChangeUsernameDialogState();
}

class ChangeUsernameDialogState extends State<ChangeUsernameDialog>{
  final _formKey = new GlobalKey<FormState>();

  bool autoValidate = false;
  String newDisplayName = "";

  String _validateDisplayName(String value)
  {
    if(value.isEmpty){
      return "Profile name can't be empty!";
    }
    return null;
  }


  Widget build(BuildContext context){
    return Scaffold(
      body: new Builder(
      builder: (newContext){
          return SimpleDialog(
            title: new Text("Enter new display name" ),
            children: <Widget>[
              new Form(
                key: _formKey, 
                autovalidate: autoValidate,

                child: new ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.all(20.0),
                      child: new TextFormField(
                        decoration: new InputDecoration(labelText: "Profile name"),
                        onSaved: (String value) {newDisplayName = value; },
                        validator: _validateDisplayName
                      )
                    ),
                    new Padding(
                      padding: EdgeInsets.all(20.0),
                      child: new FlatButton(
                        child: new Text("Submit"),
                        //validate and submit method, put here itself to avoid redefining callback with newContext vrariable
                        onPressed: () async {
                          final form = _formKey.currentState;

                          if(form.validate()){
                            form.save();
                            FirebaseUser user = await widget.auth.getCurrentUser();
                            UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
                            userUpdateInfo.displayName = newDisplayName;
                            user.updateProfile(userUpdateInfo).then( (_){
                              print("Username updated to ${userUpdateInfo.displayName}!");
                              Navigator.of(context).pop();
                              widget.displaySnackBar("Username updated!");
                            }).catchError((e) {
                              if(e.code == "ERROR_NETWORK_REQUEST_FAILED") {
                                Scaffold.of(newContext).showSnackBar(
                                    new SnackBar(
                                      content: new Text("Network error!"),
                                      duration: new Duration(seconds: 2),
                                    )
                                  );
                              }
                              else{
                                print(e);
                                Scaffold.of(newContext).showSnackBar(
                                  new SnackBar(
                                    content: new Text("An error occured, report this if it persists"),
                                    duration: new Duration(seconds: 3),
                                  )
                                );
                              }
                            });

                          } else {
                            setState( () => autoValidate = true );
                          }
                        }
                      )
                    )
                  ],
                )
              )
            ],
          );
        }
      )
    );
  }
}