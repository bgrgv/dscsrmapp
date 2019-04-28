import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dscsrmapp/services/authentication.dart';
import 'package:dscsrmapp/pages/root_page.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(Main());
  });
}

// Guys, we've to create separate dart files for each tabs. :) All The Best!
// And I appreciate the work and effort you put in to make it into the App Dev team! :) Kudos!!!

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'DSC Login',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new RootPage(auth: new Auth()));
  }
}
