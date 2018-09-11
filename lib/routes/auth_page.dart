import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';
import 'package:firebase_auth_world/colors.dart';
import 'package:firebase_auth_world/widgets/button_google.dart';


class AuthPage extends StatefulWidget {
  AuthPage({this.auth, this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() => new _AuthPageState();
}

enum FormType { login, register }

class _AuthPageState extends State<AuthPage> {
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
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
          String userId =
              await widget.auth.signInWithEmailAndPassword(_email, _password);
          print("Registered user: $userId");
        }
        widget.onSignedIn();
      } catch (e) {
        print("Error: $e");
      }
    }
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

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(height: 64.0),
          Column(
            children: <Widget>[
              Image.asset('assets/images/logo.png'),
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: buildUserInput() +
                    buildUSerButton() +
                    buildForgotPassword() + buildSeparator() + buildGoogleButton(),
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
      //SizedBox(height: 8.0),
      PrimaryColorOverride(
          color: kShrineBrown900,
          child: FlatButton(
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: ("Forgot your login details?"),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                      fontSize: 15.0,
                      fontFamily: 'Quicksand',
                    )),
                TextSpan(
                    text: " Get help singin in",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 15.0,
                      fontFamily: 'Quicksand',
                    ))
              ]),
            ),
            onPressed: () => {},
          ))
    ];
  }

  List<Widget> buildGoogleButton(){
    return[
      SizedBox(height: 8.0),
      PrimaryColorOverride(
        child: GoogleSignInButton(
          onPressed: () => {},
          )
        )

    ];
  }

  List<Widget> buildSeparator() {
    return [
      PrimaryColorOverride(
        color: kShrineBrown900,
        child: new Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 8.0),
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
                  color: Colors.black,
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
    return [
      PrimaryColorOverride(
          color: kShrineBrown900,
          child: new TextFormField(
            controller: _usernameController,
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
      )
    ];
  }

  List<Widget> buildUSerButton() {
    if (_formType == FormType.login) {
      return [
        ButtonBar(
          children: <Widget>[

            RaisedButton(
              child: Text(
                "Sign In",
                style: TextStyle(fontFamily: 'Quicksand'),
              ),
              elevation: 8.0,
              
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0))),
              onPressed: validateAndSubmit,
            )
          ],
        ),
      ];
    } else {
      //TODO: show registration screen
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
