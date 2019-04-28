import 'package:flutter/material.dart';

class Certificates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Certificates Portal",
        home: Scaffold(
            body: new Center(
                child: TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              border: InputBorder.none, hintText: 'Enter Your Register Number'),
        ))));
  }
}
