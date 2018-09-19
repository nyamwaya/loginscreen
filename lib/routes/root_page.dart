import 'package:flutter/material.dart';
import 'auth_page.dart';
import 'package:firebase_auth_world/firebase_helper/auth.dart';
import 'home_page.dart';
import 'package:firebase_auth_world/firebase_helper/database.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth, this.databse});
  final BaseAuth auth;
  final BaseDatabase databse;

  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

enum AuthStatus { notSignedIn, signedIn }

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.notSignedIn;

  initState() {
    super.initState();
    widget.auth.currentuser().then((userId) {
      setState(() {
        authStatus =
            userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
  }

  void _signedIn() {
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

  void _signedOut() {
    setState(() {
          authStatus = AuthStatus.notSignedIn;
        });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        return new AuthPage(
          auth: widget.auth,
          onSignedIn: _signedIn,
          databse: widget.databse,
        );
      case AuthStatus.signedIn:
        return new HomePage(
          auth: widget.auth,
          onSignedOut: _signedOut,
          databse: widget.databse
        );
    }
  }
}
