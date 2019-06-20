import 'package:flutter/material.dart';
import 'dart:math';
import 'package:dscsrmapp/main.dart';
import './aboutdata.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "About DSC SRM",
          ),
        ),
        resizeToAvoidBottomInset: true,
        body: About_Dsc(),
      ),
    );
  }
}

class About_Dsc extends StatefulWidget {
  @override
  _About_DscState createState() => new _About_DscState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _About_DscState extends State<About_Dsc> {
  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 12.0, right: 12.0, top: 30.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: <Widget>[
                  Text(
                      "Developer Student Club (DSC) is a Google Developers program for university students to learn mobile and web development skills. \n"
                      "The club will be open to any student,"
                      " ranging from novice developers who are just starting,"
                      " to advanced developers who want to further their skills."
                      " The club is intended as a space for students to try out new ideas and collaborate to solve mobile and web development problems.",
                      style: TextStyle(
                        // color: Colors.black,
                        fontSize: 20.0,
                        letterSpacing: 1.0,
                      )),
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                CardScrollWidget(currentPage),
                Positioned.fill(
                  child: PageView.builder(
                    itemCount: images.length,
                    controller: controller,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return Container();
                    },
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: <Widget>[
                  Text(
                      "DSC SRM - powered by Google Developers \n"
                      "SRM Institute of Science & Technology, \n"
                      "Kattankulathur, Chennai 603203 \n"
                      "India.",
                      style: TextStyle(
                        // color: Colors.black,
                        fontSize: 20.0,
                        letterSpacing: 1.0,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 22.0, vertical: 6.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 18.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(3.0, 6.0),
                      blurRadius: 10.0)
                ]),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(images[i], fit: BoxFit.cover),
                      Align(
                        alignment: Alignment.bottomLeft,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}
