import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          constraints: new BoxConstraints.expand(),
          child: new ListView(
            padding: const EdgeInsets.all(1.0),
            children: <Widget>[
              _getToolbar(context),
              _buildHeader(),
              _buildStatsBar()
            ],
          )),
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
      padding: const EdgeInsets.only(left: 16.0, top: 20.0, bottom: 24.0),
      //height: 218.0,
      child: new Row(
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
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1531078215167-91fcfe45b39e?ixlib=rb-0.3.5&s=786d61b2a3ed74d1f981ee230b1a9457&auto=format&fit=crop&w=1098&q=80.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
                  border: new Border.all(color: Colors.white, width: 4.0))),
          new Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "Kasha Killingsworth",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Quicksand',
                      fontSize: 20.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: new Text(
                    "Food innovator",
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
}
