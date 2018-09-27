import 'package:firebase_auth_world/model/auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({this.displaName, this.auth, this.onSignedOut});

  final String displaName;
  final BaseAuth auth;
  final VoidCallback onSignedOut;

  @override
  State<StatefulWidget> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: new Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        actions: <Widget>[
          new FlatButton(
              child: new Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: _signOut)
        ],
      ),
      body: Container(
        constraints: new BoxConstraints.expand(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //padding: const EdgeInsets.all(1.0),
          children: <Widget>[
            // _getToolbar(context),
            _buildHeader(),
            SizedBox(height: 30.0),
            //_buildStatsBar(),
            _buildOptions()
          ],
        ),
      ),
    );
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new BackButton(color: Colors.black45),
        ],
      ),
    );
  }

  Container _buildHeader() {
    return new Container(
      padding: const EdgeInsets.only(left: 16.0, bottom: 24.0),
      //height: 218.0,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Container(
              width: 100.0,
              height: 100.0,
              decoration: new BoxDecoration(
                  color: const Color(0xff7c94b6),
                  boxShadow: [
                    new BoxShadow(color: Colors.black38, blurRadius: 32.0)
                  ],
                  image: new DecorationImage(
                    //TODO: if not profile photo, add random robot
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1531078215167-91fcfe45b39e?ixlib=rb-0.3.5&s=786d61b2a3ed74d1f981ee230b1a9457&auto=format&fit=crop&w=1098&q=80.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
                  border: new Border.all(color: Colors.white, width: 4.0))),
          new Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 15.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "${widget.displaName}",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Quicksand',
                      fontSize: 20.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: new Text(
                    "Food innvator",
                    style: TextStyle(
                        //fontWeight: FontWeight.w600,
                        fontFamily: 'Quicksand',
                        fontSize: 16.0),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _buildStatsBar() {
    return Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        height: 100.0,
        //color: Colors.white,
        child: Card(
          elevation: 1.0,
          child: Row(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      '353',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w800),
                    ),
                    new Text(
                      "Kwizins",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black38,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Quicksand',

                        //fontWeight: FontWeight.w800
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      '12K',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w800),
                    ),
                    new Text(
                      "Views",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black38,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Quicksand',

                        //fontWeight: FontWeight.w800
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 35.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          '1.4k',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w800),
                        ),
                        new Text(
                          "Followers",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black38,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Quicksand',
                            //fontWeight: FontWeight.w800
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Container _buildOptions() {
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        children: <Widget>[
          ListTile(
            trailing: Icon(Icons.feedback),
            onTap: () => {/*TODO: log me out*/},
            title: Text('Feedbck',
                style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: 'Quicksand',
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                )),
          ),
          // ListTile(
          //   trailing: Icon(Icons.exit_to_app),
          //   onTap: (_signOut),
          //   title: Text('Logout',
          //       style: TextStyle(
          //         fontSize: 24.0,
          //         fontFamily: 'Quicksand',
          //         color: Colors.redAccent,
          //         fontWeight: FontWeight.w500,
          //       )),
          // ),
        ],
      ),
    ));
  }
}
