import 'package:dscsrmapp/Menu_Mode.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class TabScreen1 extends StatelessWidget {
  @override
  Widget imageCarousel = new Container(
    height: 200.0,
    child: new Carousel(
      boxFit: BoxFit.cover,
      images: [
        new NetworkImage(
            'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
        new NetworkImage(
            'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
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
          RaisedButton(
            color: Colors.red,
            child: Text('Menu Mode'),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute<Null>(builder: (BuildContext context) {
                return new MenuMode();
              }));
            },
          ),
        ]),
      ),
    );
  }
}
