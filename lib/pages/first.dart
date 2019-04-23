
import 'package:flutter/material.dart';
import 'Menu_Mode.dart';

class TabScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: //new Text("First"),
          new Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
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
        ],
      ),
    );
  }
}
