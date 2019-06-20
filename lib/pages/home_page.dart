import 'package:flutter/material.dart';
import 'package:dscsrmapp/services/authentication.dart';
import 'package:dscsrmapp/pages/first.dart';
import 'about.dart';
import 'certificates.dart';
import 'package:dscsrmapp/main.dart';
import './get_in_touch.dart';

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
  //bool darkTheme = false;

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

  void _resentVerifyEmail() {
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
          content:
              new Text("Link to verify account has been sent to your email"),
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
        length: 1, //TAB BAR CAN BE USED IN FUTURE, SO THE CODE IS LEFT HERE
        child: Scaffold(
          appBar: AppBar(
            // bottom: TabBar(
            //   tabs: [
            //     Tab(icon: Icon(Icons.home)),
            //     //Tab(icon: Icon(Icons.add_circle)),
            //     //Tab(icon: Icon(Icons.notifications)),
            //   ],
            // ),
            title: Text('DSC SRM'),
          ),
          drawer: Drawer(
              child: Column(
            children: <Widget>[
              new Expanded(
                child: new ListView(
                  children: <Widget>[
                    UserAccountsDrawerHeader(
                      accountName: new Text(
                        "Hey",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      accountEmail: new Text(
                        widget.userEmail,
                        style: TextStyle(fontSize: 30.0),
                      ),
                    ),
                    ListTile(title: Text("Photos")),
                    ListTile(
                      title: Text("Certificates"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Certificates()));
                      },
                    ),
                    ListTile(
                      title: Text("Get in touch"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => In_Touch()));
                      },
                    ),
                    ListTile(
                      title: Text('About us'),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => About()));
                      },
                    ),
                    ListTile(
                      title: Text("Dark Mode"),
                      trailing: Switch(
                        value: darkTheme,
                        onChanged: (changed) {
                          setState(() {
                            darkTheme = changed;
                          });
                        },
                      ),
                    ),
                    ListTile(title: Text("Sign out"), onTap: _signOut),
                  ],
                ),
              ),
              new Image.asset(
                "assets/dsc.png",
                height: 80.0,
              )
            ],
          )),
          body: TabBarView(
            children: [
              TabScreen1(),
              //TabScreen2(),
              //TabScreen3(),
            ],
          ),
        ),
      ),
      theme: darkTheme ? ThemeData.dark() : ThemeData.light(),
    );
  }
}
