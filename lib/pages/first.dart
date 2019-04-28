import 'package:dscsrmapp/eventmode.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class TabScreen1 extends StatelessWidget {
  final Widget imageCarousel = new Container(
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
  );
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new ListView(children: <Widget>[
          imageCarousel,
          Padding(
            padding: const EdgeInsets.only(top: 80.0, bottom: 80.0),
            child: new Text(
              "Place for Cards...\nWork Pending :/",
              style: TextStyle(fontSize: 30.0),
              textAlign: TextAlign.center,
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                height: 70.0,
                width: 70.0,
                child: new FloatingActionButton(
                  mini: false,
                  backgroundColor: Colors.blue[300],
                  child: Text(
                    'Events\nMode',
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                      return new EventsMode();
                    }));
                  },
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
