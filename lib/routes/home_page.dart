import 'dart:async';

import 'package:firebase_auth_world/model/Kwizn.dart';
import 'package:firebase_auth_world/model/auth.dart';
import 'package:firebase_auth_world/model/database.dart';
import 'package:firebase_auth_world/widgets/bottom_navigation.dart';
import 'package:firebase_auth_world/widgets/tab_navigator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
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
  final generalReference = FirebaseDatabase.instance
      .reference()
      .child('kwizn'); //Change end gradient color here

  StreamSubscription<Event> _onKwizineAddedSubscription;
  StreamSubscription<Event> _onNoteChangedSubscription;

  //The data coming back from the server
  List<Kwizn> data;

  TabItem currentTab = TabItem.home;

  Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
   // TabItem.favorites: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    setState(() {
      currentTab = tabItem;
    });
  }

  void _signOut() async {
    //TODO: implement auto sign user out if userId is not valid
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  //Adding something to firebase database
  void _onKwiznAdded(Event event) {
    setState(() {
      data.add(new Kwizn.fromSnapshot(event.snapshot));
    });
  }

  //updateing something on firbase, this is the realtime update.
  void _onNoteUpdated(Event event) {
    var oldKwizinValue =
        data.singleWhere((kwizn) => kwizn.id == event.snapshot.key);
    setState(() {
      data[data.indexOf(oldKwizinValue)] =
          new Kwizn.fromSnapshot(event.snapshot);
    });
  }

  @override
  void initState() {
    super.initState();
    data = new List();
    //We make our data call here because this fuction is called before anythign else
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
    return WillPopScope(
      onWillPop: () async =>
          !await navigatorKeys[currentTab].currentState.maybePop(),
      child: Scaffold(
        // appBar: new AppBar(
        //   title: new Text("Kwizny"),
        //   backgroundColor: Colors.red,
        //   actions: <Widget>[
        //     new FlatButton(
        //         child: new Text("Logout",
        //             style: new TextStyle(fontSize: 17.0, color: Colors.white)),
        //         onPressed: _signOut)
        //   ],
        // ),
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.home),
          // _buildOffstageNavigator(TabItem.favorites),
          _buildOffstageNavigator(TabItem.profile),
        ]),
        // body: Center(
        //   child: ListView.builder(
        //     itemCount: data == null ? 0 : data.length,
        //     itemBuilder: (BuildContext context, int index) {
        //       return new Restaurantcard(
        //         title: '${data[index].name}',
        //         subtitle: '${data[index].city_state}',
        //         headImmageAssetpath: '${data[index].picture_url}',
        //         //   headImmageAssetpath: 'assets/images/salad.jpg',
        //         heartCoutn: 50,
        //       );
        //     },
        //   ),
        // ),
        bottomNavigationBar: BottomNavigation(
          currentTab: currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }


  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: navigatorKeys[tabItem],
        tabItem: tabItem,
        data: data,
        onSignedOut: widget.onSignedOut,
        auth: widget.auth,
      ),
    );
  }
}
