import 'dart:async';

import 'package:firebase_auth_world/model/Kwizn.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth_world/firebase_helper/auth.dart';
import 'package:firebase_auth_world/firebase_helper/database.dart';
import 'package:firebase_auth_world/widgets/RestaurantCard.dart';

class HomePage extends StatefulWidget {
  HomePage({this.auth, this.onSignedOut, this.databse});
  final BaseAuth auth;
  final BaseDatabase databse;
  final VoidCallback onSignedOut;

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final generalReference = FirebaseDatabase.instance.reference().child('kwizn');

  Color gradientStart = Colors.deepPurple[700]; //Change start gradient color here
  Color gradientEnd = Colors.purple[500]; //Change end gradient color here

  List<Kwizn> data;

  StreamSubscription<Event> _onKwizineAddedSubscription;
  StreamSubscription<Event> _onNoteChangedSubscription;

  void _signOut() async {
    //TODO: implement auto sign user out if userId is not valid
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    data = new List();
    //this.widget.databse.getkwizn().then(_updateKwizn);
    _onKwizineAddedSubscription =
        generalReference.onChildAdded.listen(_onKwiznAdded);
    _onNoteChangedSubscription =
        generalReference.onChildChanged.listen(_onNoteUpdated);
  }

  @override
  void dispose() {
    _onKwizineAddedSubscription.cancel();
    _onNoteChangedSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Kwizny"),
        backgroundColor: Colors.red,
        actions: <Widget>[
          new FlatButton(
              child: new Text("Logout",
                  style: new TextStyle(fontSize: 17.0, color: Colors.white)),
              onPressed: _signOut)
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return new Restaurantcard(
              title: '${data[index].name}',
              subtitle: '${data[index].city_state}',
           //   headImmageAssetpath: '${data[index].picture_url}',
              headImmageAssetpath: 'assets/images/salad.jpg',
              heartCoutn: 50,
            );
          },
        ),
      ),

      //To add on click events, follow this stack overflow answer
      //https://stackoverflow.com/questions/50883918/bottom-navigation-bar-is-relaoding-all-the-widgets-each-time-i-press-a-navigatio
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.favorite), title: new Text('favorites')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: new Text('Profile'))
        ],
      ),
    );
  }

  _onKwiznAdded(Event event) {
    setState(() {
      data.add(new Kwizn.fromSnapshot(event.snapshot));
    });
  }

  _onNoteUpdated(Event event) {
    var oldKwizinValue =
        data.singleWhere((kwizn) => kwizn.id == event.snapshot.key);
    setState(() {
      data[data.indexOf(oldKwizinValue)] =
          new Kwizn.fromSnapshot(event.snapshot);
    });
  }
}

