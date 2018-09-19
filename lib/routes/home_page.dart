import 'package:flutter/material.dart';
import 'package:firebase_auth_world/firebase_helper/auth.dart';
import 'package:firebase_auth_world/firebase_helper/database.dart';

class HomePage extends StatelessWidget {
  HomePage({this.auth, this.onSignedOut, this.databse});
  final BaseAuth auth;
  final BaseDatabase databse;
  final VoidCallback onSignedOut;

  void _signOut() async {
    try {
      await auth.signOut();
      onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Welcome"),
        actions: <Widget>[
          new FlatButton(
              child: new Text("Logout",
                  style: new TextStyle(fontSize: 17.0, color: Colors.white)),
              onPressed: _signOut)
        ],
      ),
      body: new Container(
        child: new Center(
          child: new Text("Welcome", style: new TextStyle(fontSize: 32.0)),
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
            icon: new Icon(Icons.favorite), 
            title: new Text('favorites')
            ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), 
              title: new Text('Profile'))
        ],
      ),
    );
  }
}
