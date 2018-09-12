import 'package:flutter/material.dart';
import 'package:firebase_auth_world/routes/auth_page.dart';
import 'package:firebase_auth_world/routes/auth.dart';
import 'package:firebase_auth_world/routes/root_page.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: new RootPage(auth: new Auth())
     //home: new LaunchPage()
    );
  }
}