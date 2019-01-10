import 'package:firebase_auth_world/model/auth.dart';
import 'package:firebase_auth_world/model/database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_world/colors.dart';
import 'package:firebase_auth_world/widgets/button_google.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthPage extends StatefulWidget {
  AuthPage({this.databse, this.auth, this.onSignedIn});
  final BaseAuth auth;
  final BaseDatabase databse;
  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() => new _AuthPageState();
}

enum FormType { login, register }

class _AuthPageState extends State<AuthPage> {
  final formKey = new GlobalKey<FormState>();
  // This is not the best way to show a snack bar.
  // A more efficient solution is to split your build function into several widgets. This introduces a
  // new context from which you can obtain the Scaffold. In this solution, you would have an outer widget
  // that creates the Scaffold populated by instances of your new inner widgets, and then in these inner
  // widgets you would use Scaffold.of().
  // Please refactor...I did this to save time
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String _email;
  String _password;
  String _confirmPassword = "";
  String _fName = "";
  String _lName = "";

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  FormType _formType = FormType.login;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      //Auth with firebase
      try {
        if (_formType == FormType.login) {
          String userId =
              await widget.auth.signInWithEmailAndPassword(_email, _password);
          print("Signed in: $userId");
        } else {
          //TODO: save name and info here??
          String userId = await widget.auth
              .createUserWithEmailAndPassword(_email, _password);
          print("Registered user: $userId ");

          await widget.databse.pushProfileToDatabase(userId, _fName, _email);
        }
        widget.onSignedIn();
      } catch (e) {
        print("Error: $e");
      }
    }
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: ListView(
            shrinkWrap: true,
            reverse: false,
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              SizedBox(height: 100.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.scaleDown,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Kwizny',
                    style: TextStyle(
                      color: Colors.red,
                      fontFamily: 'Quicksand',
                      fontSize: 32.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              new Container(
                padding: EdgeInsets.all(16.0),
                child: new Form(
                  key: formKey,
                  child: new Column(
                    children: buildUserInput() +
                        //buildForgotPassword() +
                        buildLoginButton() +
                        // buildSeparator() +
                        // buildGoogleButton() +
                        buildRegister(),
                  ),
                ),
              ),

              //TODO: Add or sign in with google
            ],
          ),
        ));
  }

  List<Widget> buildForgotPassword() {
    return [
      SizedBox(height: 8.0),

      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FlatButton(
            child: Text("Forgot Password?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: 15.0,
                  fontFamily: 'Quicksand',
                )),
            onPressed: () => {},
          )
        ],
      )
      //SizedBox(height: 8.0),
    ];
  }

  List<Widget> buildRegister() {
    if (_formType == FormType.login) {
      return [
        // SizedBox(height: 10.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            PrimaryColorOverride(
                color: kShrineBrown900,
                child: FlatButton(
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: ("Don't have an account?"),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black38,
                            fontSize: 15.0,
                            fontFamily: 'Quicksand',
                          )),
                      TextSpan(
                          text: " Sign up.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontSize: 15.0,
                            fontFamily: 'Quicksand',
                          ))
                    ]),
                  ),
                  onPressed: moveToRegister,
                ))
          ],
        )
      ];
    } else {
      return [
        // SizedBox(height: 10.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            PrimaryColorOverride(
                color: kShrineBrown900,
                child: FlatButton(
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: ("Have an account?"),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black38,
                            fontSize: 15.0,
                            fontFamily: 'Quicksand',
                          )),
                      TextSpan(
                          text: " Sign In.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontSize: 15.0,
                            fontFamily: 'Quicksand',
                          ))
                    ]),
                  ),
                  onPressed: moveToLogin,
                ))
          ],
        )
      ];
    }
  }

  List<Widget> buildGoogleButton() {
    return [
      SizedBox(height: 8.0),
      PrimaryColorOverride(
          child: GoogleSignInButton(
        onPressed: () => {},
      ))
    ];
  }

  List<Widget> buildSeparator() {
    return [
      PrimaryColorOverride(
        color: kShrineBrown900,
        child: new Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(
              left: 30.0, right: 30.0, top: 24.0, bottom: 0.0),
          alignment: Alignment.center,
          child: Row(
            children: <Widget>[
              new Expanded(
                child: new Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(border: Border.all(width: 0.25)),
                ),
              ),
              Text(
                "OR",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              new Expanded(
                child: new Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(border: Border.all(width: 0.25)),
                ),
              ),
            ],
          ),
        ),
      )
    ];
  }

  List<Widget> buildUserInput() {
    if (_formType == FormType.login) {
      return [
        PrimaryColorOverride(
            color: kShrineBrown900,
            child: new TextFormField(
              controller: _emailController,
              decoration: new InputDecoration(labelText: "email"),
              validator: (value) =>
                  value.isEmpty ? 'Email can\'t be empty' : null,
              onSaved: (value) => _email = value,
            )),
        const SizedBox(height: 12.0),
        PrimaryColorOverride(
          color: kShrineBrown900,
          child: new TextFormField(
            controller: _passwordController,
            decoration: new InputDecoration(labelText: "password"),
            validator: (value) =>
                value.isEmpty ? 'Password can\'t be empty' : null,
            onSaved: (value) => _password = value,
            obscureText: true,
          ),
        ),
        new Column(
          children: buildForgotPassword(),
        )
      ];
    } else {
      return [
        PrimaryColorOverride(
          color: kShrineBrown900,
          child: TextFormField(
            controller: _firstNameController,
            decoration: InputDecoration(labelText: "first name"),
            validator: (value) =>
                value.isEmpty ? 'Last name can\'t be empty' : null,
            onSaved: (value) => _fName = value,
          ),
        ),
        // PrimaryColorOverride(
        //   color: kShrineBrown900,
        //   child: TextFormField(
        //     controller: _lastNameController,
        //     decoration: InputDecoration(labelText: "last name"),
        //     validator: (value) => value.isEmpty ? 'Last name can\'t be empty' : null,
        //     onSaved: (value) => _lName = value,

        //   ),
        // ),
        PrimaryColorOverride(
            color: kShrineBrown900,
            child: new TextFormField(
              controller: _emailController,
              decoration: new InputDecoration(labelText: "email"),
              validator: (value) =>
                  value.isEmpty ? 'Email can\'t be empty' : null,
              onSaved: (value) => _email = value,
            )),

        PrimaryColorOverride(
          color: kShrineBrown900,
          child: new TextFormField(
            controller: _passwordController,
            decoration: new InputDecoration(labelText: "password"),
            validator: (value) =>
                value.isEmpty ? 'Password can\'t be empty' : null,
            onSaved: (value) => _password = value,
            obscureText: true,
          ),
        ),

        PrimaryColorOverride(
          color: kShrineBrown900,
          child: new TextFormField(
            controller: _confirmPasswordController,
            decoration: new InputDecoration(labelText: "confirm password"),
            validator: (value) =>
                value.isEmpty ? 'Confirm Password can\'t be empty' : null,
            onSaved: (value) => _confirmPassword = value,
            obscureText: true,
          ),
        )
      ];
    }
  }

  List<Widget> buildLoginButton() {
    if (_formType == FormType.login) {
      return [
        //SizedBox(height: 16.0),
        ButtonBar(
          children: <Widget>[
            RaisedButton(
              color: Colors.redAccent,
              child: Text(
                "Sign in",
                style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              elevation: 8.0,
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0))),
              onPressed: validateAndSubmit,
            )
          ],
        )
      ];
    } else {
      //TODO: show registration flow
      return [
        //SizedBox(height: 8.0),
        ButtonBar(
          children: <Widget>[
            RaisedButton(
              color: Colors.redAccent,
              child: Text(
                "Sign Up",
                style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              elevation: 8.0,
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0))),
              //onPressed: validateAndSubmit,
              onPressed: () {
                if (_passwordController.value.text.toString().trim() ==
                    _confirmPasswordController.value.text.toString().trim()) {
                  //Passwords match
                  validateAndSubmit();
                } else {
                  //Passwords dont match
                  showInSnackBar(
                      "Your Password and confirm password did not match, try again");

                  String pWord =
                      _passwordController.value.text.toString().trim();
                  String conPWord =
                      _confirmPasswordController.value.text.toString().trim();
                  print(
                      "Your Password and confirm password do not match: $pWord  $conPWord");
                }
              },
            )
          ],
        )
      ];
    }
  }
}

class PrimaryColorOverride extends StatelessWidget {
  const PrimaryColorOverride({Key key, this.color, this.child})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(primaryColor: color),
    );
  }
}
