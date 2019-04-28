import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'About DSC SRM',
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Center(
            child: Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Image.asset("assets/dsc.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0, bottom: 80.0),
              child: new Text("Write something cool about us XD!"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Container(
                height: 200.0,
                child: new Carousel(
                  boxFit: BoxFit.cover,
                  images: [
                    new ExactAssetImage('assets/2.jpg'),
                    new ExactAssetImage('assets/3.jpg'),
                    new ExactAssetImage('assets/4.jpg'),
                  ],
                  animationCurve: Curves.fastOutSlowIn,
                  animationDuration: Duration(milliseconds: 1000),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
