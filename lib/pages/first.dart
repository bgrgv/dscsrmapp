import 'package:dscsrmapp/eventmode.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

void main() => runApp(TabScreen1());

class events{
  String key;
  String eventname;
  String eventlink;
  String icon;
  String idname;

  events(this.eventname,this.icon,this.eventlink,this.idname);

  events.createevent(DataSnapshot snapshot): key = snapshot.key,
                  eventname = snapshot.value["Event Name"],
                  eventlink = snapshot.value["Event Link"],
                  icon = snapshot.value["icon"],
                  idname = snapshot.value["idname"];

  toJson(){
    return {
      "Event Name" : eventname,
      "Event Link" : eventlink,
      "icon" : icon,
      "idname" : idname,
    };
  }
}


class TabScreen1 extends StatefulWidget {


  @override
  EventState createState() {
    return new EventState();
  }
}

class EventState extends State<TabScreen1> {
  List<events> itemsEvent = List();
  events itemEvent;
  DatabaseReference itemRefEvent;

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
  final Widget myList = new Container(
    child: new ListView(),
  );

  @override
  void initState() {
    super.initState();
    itemEvent = events("", "", "", "");
    final FirebaseDatabase database = FirebaseDatabase.instance;
    itemRefEvent = database.reference().child("DSC SRM APP/events");
    itemRefEvent.onChildAdded.listen(_onEntryAddedShop);
    itemRefEvent.onChildChanged.listen(_onEntryChangedShop);
  }

  _onEntryAddedShop(Event event) {
    setState(() {
      itemsEvent.add(events.createevent(event.snapshot));
    });
  }

  _onEntryChangedShop(Event event) {
    var old = itemsEvent.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });
    setState(() {
      itemsEvent[itemsEvent.indexOf(old)] = events.createevent(event.snapshot);
    });
  }
  @override
  Widget build(BuildContext context) {
    List getDummyList() {
      List list = List.generate(10, (i) {
        return "Item ${i + 1}";
      });
      return list;
    }
    List items = getDummyList();
    return new MaterialApp(
      home: new Scaffold(
        body: new Column(children: <Widget>[
          imageCarousel,
          getEventList(),
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

  getEventList(){
    return  new SizedBox(height:MediaQuery.of(context).size.height*0.43,width: MediaQuery.of(context).size.width, child: FirebaseAnimatedList(
        query: itemRefEvent,
        itemBuilder:(_, DataSnapshot snapshot, Animation<double> animation, int index){
          return Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Card(
              elevation: 5,
              child: Container(
                height: 100.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              topLeft: Radius.circular(5)
                          ),

                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(itemsEvent[index].icon)
                          )
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(itemsEvent[index].eventname,style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 48, 48, 54)
                            ),),
//                            Padding(
//                              padding: EdgeInsets.fromLTRB(left, top, right, bottom),
//                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                              child: Container(
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.teal),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Text(itemsEvent[index].idname,textAlign: TextAlign.center,),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                              child: Container(
                                width: 180,
                                height: 22,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.teal),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Colors.black,
                                ),
                                child: Text("  Register For this event!",style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,

                                ),),


                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
    ),);
  }

}

class myhome extends StatelessWidget {
  @override
   Widget build(BuildContext context){
    return Scaffold(
    body: Center(child: ListView()));
  }
}
