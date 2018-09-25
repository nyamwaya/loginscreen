import 'package:firebase_auth_world/style.dart';
import 'package:firebase_auth_world/widgets/ImageURILoad.dart';
import 'package:firebase_auth_world/widgets/kwizny_summary.dart';
import 'package:firebase_auth_world/widgets/separator.dart';
import 'package:flutter/material.dart';

class KwiznDetailpage extends StatelessWidget {
  KwiznDetailpage({
    this.title,
    this.address,
    this.cityState,
    this.pictureUrl,
    this.color,
    /* Enable this if you choes to perform on tap the other way [See coment in kwiznyListPage] this.materialIndex: 500 */
  });
  final String title;
  final String address;
  final String cityState;
  final String pictureUrl;
  final MaterialColor color;
  /* Enable this if you choes to perform on tap the other way final int materialIndex; */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: new BoxConstraints.expand(),
        color: new Color(0xFFFFFF),
        child: new ListView(
          padding: const EdgeInsets.all(1.0),
          children: <Widget>[
            _getToolbar(context),
            _getBackground(),
            _buildHeader(),
            // _buildContent(),
            // _getGradient(),
            //_getContent(),
          ],
        ),
      ),
    );
  }

  // Container _buildContent() {
  //   return new Container(
  //     child: new ListView(
  //     padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
  //     children: <Widget>[
  //       new KwiznySummary(title, cityState)

  //     ],
  //   ));
  // }

  Container _getBackground() {
    return new Container(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      height: 218.0,
      child: new Card(
        elevation: 10.0,
        child: new Column(
          children: <Widget>[
            new ClipRRect(
              borderRadius: new BorderRadius.circular(8.0),
              child: new Image.network(
                pictureUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                height: 200.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildHeader() {
    return new Container(
        child: new Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: new Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Row(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Expanded(
                        child: new Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            title,
                            style: const TextStyle(
                                letterSpacing: 1.0,
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Quicksand'),
                          ),
                          new Text(
                            cityState,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 14.0,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
                new Container(
                  child: new Row(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[
                      _kwiznyValue(
                          value: '571',
                          icon: Icons.favorite_border
                         // image: 'assets/images/ic_distance.png'
                          ),
                      new Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      ),
                      _kwiznyValue(
                          value: '5 Mins',
                          icon: Icons.time_to_leave
                         // image: 'assets/images/ic_distance.png'
                         ),

                      // new Text(
                      //   "data",
                      //   style: TextStyle(
                      //     color: Colors.black45,
                      //     fontSize: 14.0,
                      //     fontWeight: FontWeight.w400
                      //   ),
                      // )
                    ],
                  ),
                )
              ],
            )
          ]),
    ));
  }

  Widget _kwiznyValue({String value, IconData icon}) {
    return new Container(
      child: new Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
        new Icon(icon, size: 16.0,),
        new Container(width: 8.0),
        new Text(
          value,
          style: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              fontFamily: 'Quicksand'),
        ),
      ]),
    );
  }

  Container _getGradient() {
    final color = const Color(0xFFfc5185);
    final eColor = const Color(0xFFf99552);
    return new Container(
      margin: new EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: <Color>[color, eColor],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Widget _getContent() {
    final _overviewTitle = 'Overview'.toUpperCase();
    return new Container(
      child: new ListView(
        padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
        children: <Widget>[
          new KwiznySummary(
            title,
            address,
            cityState,
            pictureUrl,
            horizontal: false,
          ),
          new Container(
            padding: new EdgeInsets.symmetric(horizontal: 32.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(_overviewTitle,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w400,
                        fontSize: 20.0)),
                new Separator(),
                new Text(address,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w400))
              ],
            ),
          )
        ],
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
}
