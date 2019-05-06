import 'package:flutter/material.dart';
import 'pages/eventmode/quiz.dart';
import 'pages/eventmode/qrgen.dart';
import 'main.dart';

class EventsMode extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EventsModeState();
  }
}

class EventsModeState extends State<EventsMode> {
  int _currPage = 0;
  final _pageLabels = [
    Center(child: Text("Placeholder for events.srmdsc.com")),
    QrScreen(),
    KahootWebView(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Events Mode',
        theme: darkTheme ? ThemeData.dark() : ThemeData.light(),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Events Mode"),
          ),
          body: _pageLabels[_currPage],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currPage,
            onTap: (int index) {
              setState(() {
                _currPage = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  title: Text(
                    "Register",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle),
                  title: Text(
                    "Verify",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore),
                  title: Text(
                    "Quiz",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ));
  }
}
