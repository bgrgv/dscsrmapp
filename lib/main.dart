import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'first.dart';
import 'second.dart';
import 'third.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp])
      .then((_) {
    runApp(Main());
  });
}

// Guys, we've to create separate dart files for each tabs. :) All The Best!
// And I appreciate the work and effort you put in to make it into the App Dev team! :) Kudos!!!

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text("UserName here", style: TextStyle(fontSize: 20.0)),
                  accountEmail: Text("Email here", style: TextStyle(fontSize: 15.0)),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text("?",style: TextStyle(fontSize: 50.0),
                    ),
                  ),
                ),
                ListTile(
                  title: Text("Sign out", style: TextStyle(fontSize: 15.0)),
                  //onTap: yet to figure out what to put here
                ) 
              ],
              )
              
          ),
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
