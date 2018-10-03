import 'dart:async';

import 'package:firebase_auth_world/style.dart';
import 'package:firebase_auth_world/widgets/ImageURILoad.dart';
import 'package:firebase_auth_world/widgets/kwizny_summary.dart';
import 'package:firebase_auth_world/widgets/map_kwizny.dart';
import 'package:firebase_auth_world/widgets/separator.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:geocoder/geocoder.dart';

class KwiznDetailPage extends StatefulWidget {
  KwiznDetailPage({
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
  @override
  State<StatefulWidget> createState() => new _KwiznDetailPageState();
}

class _KwiznDetailPageState extends State<KwiznDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        //centerTitle: true,
        leading: new BackButton(color: Colors.white),
        title: new Text(
          "Details",
          style: TextStyle(
              //  fontWeight: FontWeight.w800,
              color: Colors.white,
              // fontFamily: 'Quicksand',
              fontSize: 20.0),
        ),
      ),
      body: Container(
        constraints: new BoxConstraints.expand(),
        color: Colors.white,
        child: new ListView(
          padding: const EdgeInsets.all(1.0),
          children: <Widget>[
            //_getToolbar(context),
            _buildBackgroundImage(),
            _buildHeader(),
            _buildSeparator(),
            _buildDescription(),
            _buildSeparator(),
            _buildSectionTitleText(),
            MapKwizny(address: widget.address),
          ],
        ),
      ),
    );
  }

  Container _buildBackgroundImage() {
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
                widget.pictureUrl,
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
        child: new Column(children: <Widget>[
          new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Expanded(
                      child: new Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          widget.title,
                          style: const TextStyle(
                              letterSpacing: 1.0,
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Quicksand'),
                        ),
                        new Text(
                          widget.cityState,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _kwiznyValue(value: '571', icon: Icons.favorite_border),
                    new Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    ),
                    _kwiznyValue(value: '5 Mins', icon: Icons.time_to_leave),
                  ],
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }

  Container _buildSeparator() {
    return Container(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: Separator(
        margin: new EdgeInsets.symmetric(vertical: 24.0),
        height: 2.0,
        width: double.infinity,
        color: Colors.black12,
      ),
    );
  }

  Container _buildDescription() {
    return Container(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: new Text(
        "White radish is eaten raw and coocked, and nutrition is the same. It's just different in effect, raw white radish hangover, anti-cancer effect, coocked to eat stomach and digestin, smooth and wide...",
        style: TextStyle(
            color: Colors.black87,
            fontSize: 18.0,
            //fontWeight: FontWeight.w400,
            fontFamily: 'Quicksand'),
      ),
    );
  }

  Widget _buildSectionTitleText() {
    final _directionsTitle = 'Location';
    return Container(
        padding: new EdgeInsets.only(left: 20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              _directionsTitle,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Quicksand',
                  //fontWeight: FontWeight.w600,
                  letterSpacing: 1.0,
                  fontSize: 24.0),
            ),
          ],
        ));
  }

  Widget _kwiznyValue({String value, IconData icon}) {
    return new Container(
      child: new Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
        new Icon(
          icon,
          size: 16.0,
        ),
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
}
