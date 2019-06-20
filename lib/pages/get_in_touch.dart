import 'package:flutter/material.dart';
import 'package:dscsrmapp/main.dart';

class In_Touch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Get In Touch"),
        ),
        body: Details(),
      ),
    );
  }
}

class Details extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _DetailsState();
}

class _DetailsState extends State<Details> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      body: new Form(
        key: this._formKey,
        child: new ListView(
          padding: EdgeInsets.only(left: 2.0, top: 10.0, right: 2.0, bottom: 10.0),
          children: <Widget>[
            new TextFormField(
              decoration: new InputDecoration(
                labelText: "Enter Email",
                fillColor: Colors.grey,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(),
                ),
                //fillColor: Colors.green
              ),
              validator: (val) {
                if (val.length == 0) {
                  return "Email cannot be empty";
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 8.0),
            new TextFormField(
              decoration: new InputDecoration(
                labelText: "Enter Name",
                fillColor: Colors.grey,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(),
                ),
                //fillColor: Colors.green
              ),
              validator: (val) {
                if (val.length == 0) {
                  return "Name cannot be empty";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 8.0),
            new TextFormField(
              decoration: new InputDecoration(
                labelText: "Enter Subject",
                fillColor: Colors.grey,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(),
                ),
                //fillColor: Colors.green
              ),
              validator: (val) {
                if (val.length == 0) {
                  return "Subject cannot be empty";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 8.0),
            new TextFormField(
              decoration: new InputDecoration(
                labelText: "Enter phone no",
                fillColor: Colors.grey,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(),
                ),
                //fillColor: Colors.green
              ),
              validator: (val) {
                if (val.length == 0) {
                  return "phoneno cannot be empty";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 8.0),
            new TextFormField(
              decoration: new InputDecoration(
                labelText: "Enter message",
                fillColor: Colors.grey,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(),
                ),
                //fillColor: Colors.green
              ),
              validator: (val) {
                if (val.length == 0) {
                  return " cannot be empty";
                } else {
                  return null;
                }
              },
            ),
            new Container(
                width: screenSize.width,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("SEND YOUR MESSAGE"),
                  color: Colors.blue,
                  shape: StadiumBorder(),
                  splashColor: Colors.grey,
                ))
          ],
        ),
      ),
    );
  }
}

const List<Color> signInGradients = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];
