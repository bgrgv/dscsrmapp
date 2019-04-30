import 'package:dscsrmapp/eventmode.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:dscsrmapp/main.dart';


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
      theme: darkTheme ? ThemeData.dark() : ThemeData.light(),
      home: new Scaffold(
        body: new ListView(children: <Widget>[
          imageCarousel,
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child:NewCardWidget() //changing this to NewCardWidget2 will give you second template
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

class NewCardWidget extends StatelessWidget { //Template 1
  NewCardWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('The Enchanted Nightingale'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            ButtonTheme.bar(
              // make buttons use the appropriate styles for cards
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(  //Buttons if not needed remove it
                    child: const Text('BUY TICKETS'),
                    onPressed: () {/* ... */},
                  ),
                  FlatButton( //Buttons if not needed remove it
                    child: const Text('LISTEN'),
                    onPressed: () {/* ... */},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewCardWidget2 extends StatelessWidget { //template 2
  NewCardWidget2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Card(
                    child: new Column(
                      children: <Widget>[
                        new Image.network('https://i.ytimg.com/vi/fq4N0hgOWzU/maxresdefault.jpg'),
                        new Padding(
                          padding: new EdgeInsets.all(7.0),
                          child: new Row(
                            children: <Widget>[
                             new Padding(
                               padding: new EdgeInsets.all(7.0),
                               child: new Icon(Icons.thumb_up),
                             ),
                             new Padding(
                               padding: new EdgeInsets.all(7.0),
                               child: new Text('Like',style: new TextStyle(fontSize: 18.0),),
                             ),
                             new Padding(
                               padding: new EdgeInsets.all(7.0),
                               child: new Icon(Icons.comment),
                             ),
                             new Padding(
                               padding: new EdgeInsets.all(7.0),
                               child: new Text('Comments',style: new TextStyle(fontSize: 18.0)),
                             )

                            ],
                          )
                        )
                      ],
                    ),
                  );
  }
}

