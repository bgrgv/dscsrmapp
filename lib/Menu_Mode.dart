import 'package:flutter/material.dart';

class MenuMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Mode'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.person_add),
            title: new Text('Registration'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.code),
            title: new Text('QR Code'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer), title: Text('Quiz'))
        ],
      ),
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            RaisedButton(
              color: Colors.red,
              child: Text('Main Screen'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
