import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth_world/routes/auth_page.dart';
import 'package:firebase_auth_world/model/auth.dart';
import 'package:firebase_auth_world/routes/root_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_auth_world/model/database.dart';



Future<void> main() async{
  final FirebaseApp app = await FirebaseApp.configure(
    name: 'db2',
    options: FirebaseOptions(
    googleAppID: '1:440256306983:android:2791a189fdb4528e',
    apiKey: 'AIzaSyCuD9k2wAmfOmqfEjabowQt8XOflQvX4GY',
    databaseURL: 'https://testauth-ac1b9.firebaseio.com'
    //TODO: add gcmSenderID: for ios compatability

    )
  );
  runApp(new MyApp());
} 


//void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: new RootPage(auth: new Auth(), databse: new Database())
     //home: new LaunchPage()
    );
  }
}
