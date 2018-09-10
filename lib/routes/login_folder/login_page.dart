import 'package:flutter/material.dart';
import 'package:firebase_auth_world/widgets/button_google.dart';


class LoginPage extends StatefulWidget {

   @override
  State<StatefulWidget> createState() => _LoginPage(); 

}
  
class _LoginPage extends State<LoginPage> with TickerProviderStateMixin {
  
  
  
  Widget LoginPage() {
    return new Container(
      height: MediaQuery.of(context).size.height,
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   image: DecorationImage(
      //     colorFilter: new ColorFilter.mode(
      //         Colors.black.withOpacity(0.05), BlendMode.dstATop),
      //     image: AssetImage('assets/images/mountains.jpg'),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: new Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 50.0, bottom: 10.0, left: 100.0, right: 100.0),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 40.0,
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: new Text(
                    "EMAIL",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: Colors.redAccent,
                    width: 0.5,
                    style: BorderStyle.solid),
              ),
            ),
            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  child: TextField(
                    obscureText: true,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'samarthagarwal@live.com',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 24.0,
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: new Text(
                    "PASSWORD",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: Colors.redAccent,
                    width: 0.5,
                    style: BorderStyle.solid),
              ),
            ),
            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  child: TextField(
                    obscureText: true,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '*********',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 24.0,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: new FlatButton(
                  child: new Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  onPressed: () => {},
                ),
              ),
            ],
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    color: Colors.redAccent,
                    onPressed: () => {},
                    child: new Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "LOGIN",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
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
                  "OR CONNECT WITH",
                  style: TextStyle(
                    color: Colors.grey,
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
          ), new Container(
            padding: new EdgeInsets.all(10.0,
        ),
            child: GoogleSignInButton(),
          ),
        //  new Container(
          //   width: MediaQuery.of(context).size.width,
          //   margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
          //   child: new Row(
          //     children: <Widget>[
          //       new Expanded(
          //         child: new Container(
          //           margin: EdgeInsets.only(left: 8.0),
          //           alignment: Alignment.center,
          //           child: new Row(
          //             children: <Widget>[
          //               new Expanded(
          //                 child: new FlatButton(
          //                   shape: new RoundedRectangleBorder(
          //                     borderRadius: new BorderRadius.circular(30.0),
          //                   ),
          //                   color: Color(0Xffdb3236),
          //                   onPressed: () => {},
          //                   child: new Container(
          //                     child: new Row(
          //                       mainAxisAlignment: MainAxisAlignment.center,
          //                       children: <Widget>[
          //                         new Expanded(
          //                           child: new FlatButton(
          //                             onPressed: () => {},
          //                             padding: EdgeInsets.only(
          //                               top: 20.0,
          //                               bottom: 20.0,
          //                             ),
          //                             child: new Row(
          //                               mainAxisAlignment:
          //                                   MainAxisAlignment.spaceEvenly,
          //                               children: <Widget>[
          //                                 Image.asset(
          //                                   'assets/images/glogo.png',
          //                                   height: 18.0,
          //                                   width: 18.0,
          //                                 ),
          //                                 Padding(
          //                                   padding: const EdgeInsets.symmetric(
          //                                       vertical: 8.0),
          //                                   child: Text(
          //                                     "Sign in with Google",
          //                                     style: TextStyle(
          //                                       fontFamily: 'Roboto',
          //                                       fontWeight: FontWeight.w500,
          //                                       color: Colors.white,
          //                                     ),
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
  
  
  
  
  
  

  
  
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: LoginPage(),
    );
  }


}