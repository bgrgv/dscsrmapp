import 'package:flutter/material.dart';
import 'package:dscsrmapp/services/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangePasswordDialog extends StatefulWidget{
  final void Function(String) displaySnackBar;

  ChangePasswordDialog({Key key, @required this.displaySnackBar, this.auth}) : super(key: key);

  final BaseAuth auth;

  @override
  ChangePasswordDialogState createState() => new ChangePasswordDialogState();
}

class ChangePasswordDialogState extends State<ChangePasswordDialog>{
     
     bool _validateOldPassword = true;
     bool _validateNewPassword = true;
     String _errorOldPassword = "";
     String _errorNewPassword = "";
     final textControllerOldPassword = new TextEditingController();
     final textControllerNewPassword = new TextEditingController();
     final textControllerReNewPassword = new TextEditingController();

    void dispose()
    {
      textControllerOldPassword.dispose();
      textControllerNewPassword.dispose();
      textControllerReNewPassword.dispose();
      super.dispose();
    }

      @override
      Widget build(BuildContext context){
        
          return Scaffold(
            body: new Builder(
              builder: (newContext){
             return SimpleDialog(
            title: new Text("Setup new password"),
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0), 
                child: new TextField(
                  controller: textControllerOldPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter old password",
                    errorText: _validateOldPassword?null:_errorOldPassword,
                  ),
                ),
              ),
              new Padding(
                padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 10.0), 
                child: new TextField(
                  controller: textControllerNewPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter new password",
                  ),
                ),
              ),
              new Padding(
              padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 10.0),
              child: new TextField(
                      controller: textControllerReNewPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Re-enter new password",
                        errorText: _validateNewPassword?null:_errorNewPassword,
                      ),
                    ),
              ),
              new FlatButton(
                child: new Text("Done!"),
                onPressed: () async {
                  FirebaseUser user = await widget.auth.getCurrentUser();
                  String userEmail = user.email;
                  AuthCredential credentials = EmailAuthProvider.getCredential(email: userEmail, password: textControllerOldPassword.text);                   
                  user.reauthenticateWithCredential(credentials).then((_){
                      if(textControllerNewPassword.text!=textControllerReNewPassword.text)
                        {
                          setState(() {
                            _validateOldPassword = true;
                            _validateNewPassword = false;
                            _errorNewPassword = "Passwords do not match";
                          });
                        }
                        else{
                          print("Current value of new password = ${textControllerNewPassword.text}");
                          user.updatePassword(textControllerNewPassword.text).catchError((e){
                            print("Error, could not update, new password should have been: ${textControllerNewPassword.text}");
                          });

                          print("Password has been set as ${textControllerNewPassword.text}");
                          textControllerOldPassword.clear();
                          textControllerNewPassword.clear();
                          textControllerReNewPassword.clear();
                          Navigator.of(context).pop();
                          widget.displaySnackBar("Password Updated!");
                        }
                  }).catchError((e) {
                    if(e.code == "ERROR_NETWORK_REQUEST_FAILED")
                    {
                      Scaffold.of(newContext).showSnackBar(
                          new SnackBar(
                            content: new Text("Network error!"),
                            duration: new Duration(seconds: 2),
                          )
                        );
                    }
                    else{
                    print(e);
                    setState(() {
                      _validateOldPassword = false;
                      _errorOldPassword = "Incorrect password";
                      });
                    }
                  });                
                },
              ),
            ],
        );
              }
            )
        );
       }
    } 
 