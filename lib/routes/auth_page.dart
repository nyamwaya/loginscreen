import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';
import 'package:firebase_auth_world/colors.dart';

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
          SizedBox(height: 80.0),
          Column(
            children: <Widget>[
              Image.asset('assets/images/logo.png'),
              SizedBox(height: 16.0),
              Text(
                'KWIZNY',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                ),
              ),
            ],
          ),
          //SizedBox(height: 120.0),
          new Container(
            padding: EdgeInsets.all(16.0),
            child: new Form(
              key: formKey,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: buildUserInput() + buildUSerButton(),
              ),
            ),
          ),
        ],
      ),
    ));
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

  // List<Widget> buildInputs() {
  //   return [
  //     new TextFormField(
  //       decoration: new InputDecoration(labelText: "email"),
  //       validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
  //       onSaved: (value) => _email = value,
  //     ),
  //     new TextFormField(
  //       decoration: new InputDecoration(labelText: "password"),
  //       validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
  //       onSaved: (value) => _password = value,
  //       obscureText: true,
  //     ),
  //   ];
  // }

  List<Widget> buildUSerButton() {
    if (_formType == FormType.login) {
      return [
        ButtonBar(
          children: <Widget>[

            //TODO: Show "Don't have an account? Sign up." text. 

            
            // FlatButton(
            //   child: Text("Login",
            //       style: TextStyle(fontSize: 20.0, fontFamily: 'Quicksand')),
            //   shape: BeveledRectangleBorder(
            //     borderRadius: BorderRadius.all(Radius.circular(7.0)),
            //   ),
            //   onPressed: validateAndSubmit,
            // ),

            RaisedButton(
              child: Text(
                "Login",
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

  // List<Widget> buildSubmitButtons() {
  //   if (_formType == FormType.login) {
  //     return [
  //       new RaisedButton(
  //         child: new Text("Login", style: new TextStyle(fontSize: 20.0)),
  //         onPressed: validateAndSubmit,
  //       ),
  //       new FlatButton(
  //         child: new Text("Create an account",
  //             style: new TextStyle(fontSize: 20.0)),
  //         onPressed: moveToRegister,
  //       )
  //     ];
  //   } else {
  //     return [
  //       new RaisedButton(
  //         child: new Text("Create an account",
  //             style: new TextStyle(fontSize: 20.0)),
  //         onPressed: validateAndSubmit,
  //       ),
  //       new FlatButton(
  //         child: new Text("Have an account? Login",
  //             style: new TextStyle(fontSize: 20.0)),
  //         onPressed: moveToLogin,
  //       )
  //     ];
  //   }
  // }
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
