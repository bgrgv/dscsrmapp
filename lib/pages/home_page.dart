import 'package:flutter/material.dart';
import 'package:dscsrmapp/services/authentication.dart';
import 'dart:async';
import 'package:dscsrmapp/pages/first.dart';
import 'package:dscsrmapp/pages/second.dart';
import 'package:dscsrmapp/pages/third.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.onSignedOut, this.userEmail})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;
  final String userEmail;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  bool _isEmailVerified = false;

  @override
  void initState() {
    super.initState();

    _checkEmailVerification();
  }

  void _checkEmailVerification() async {
    _isEmailVerified = await widget.auth.isEmailVerified();
    if (!_isEmailVerified) {
      _showVerifyEmailDialog();
    }
  }

  void _resentVerifyEmail(){
    widget.auth.sendEmailVerification();
    _showVerifyEmailSentDialog();
  }

  void _showVerifyEmailDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content: new Text("Please verify account in the link sent to email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Resent link"),
              onPressed: () {
                Navigator.of(context).pop();
                _resentVerifyEmail();
              },
            ),
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content: new Text("Link to verify account has been sent to your email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.add_circle)),
                Tab(icon: Icon(Icons.notifications)),
              ],
            ),
            title: Text('DSC SRM'),
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: new Text(""),
                accountEmail: new Text(widget.userEmail),
                ),
             ListTile(
                title: Text("Sign out"),
                onTap: _signOut
                ),
              ListTile(
                title: Text('About us'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>About_us())
                  );
                },
              ),
              ],
            )
          ),
          body: TabBarView(
            children: [
              TabScreen1(),
              TabScreen2(),
              TabScreen3(),
            ],
          ),
        ),
      ),
    );
  }
}

class About_us extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
      ),
      body: Center(
        child: Text('DSC SRM App in progress!', textDirection: TextDirection.ltr,),
      ),
    );
  }
}
