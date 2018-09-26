import 'dart:async';

import 'package:firebase_auth_world/style.dart';
import 'package:firebase_auth_world/widgets/ImageURILoad.dart';
import 'package:firebase_auth_world/widgets/kwizny_summary.dart';
import 'package:firebase_auth_world/widgets/separator.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

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

class _KwiznDetailPageState extends State<KwiznDetailPage>{

  /* Enable this if you choes to perform on tap the other way final int materialIndex; */

  final double latitude = 45.1756032;
  final double longitude = -93.66159359999999;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      body: Container(
        constraints: new BoxConstraints.expand(),
        color: Colors.white,
        child: new ListView(
          padding: const EdgeInsets.all(1.0),
          children: <Widget>[
            _getToolbar(context),
            _buildBackgroundImage(),
            _buildHeader(),
            _buildSeparator(),
            _buildDescription(),
            _buildSeparator(),
            _buildSectionTitleText(),
            _buildMap(latitude, longitude)
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
    ));
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

  Container _buildMap(double lat, double long) {
    return new Container(
      padding: const EdgeInsets.all(10.0),
      height: 218.0,
      child: new Card(
        elevation: 10.0,
        child: new Column(
          children: [
            new Flexible(
              child: new FlutterMap(
                options: new MapOptions(
                    //minZoom: 10.0,
                    center: new LatLng(lat, longitude),
                    zoom: 13.0),
                layers: [
                  new TileLayerOptions(
                    urlTemplate: "https://api.tiles.mapbox.com/v4/"
                        "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                    subdomains: ['a', 'b', 'c'],
                    additionalOptions: {
                      'accessToken':
                          'pk.eyJ1IjoiYWxlY2tzb24iLCJhIjoiY2ptam5lcWFnMGhneTN2cWx1b3UybmVrcyJ9.J6357hZKDUPwyx9Ovz9TQg',
                      'id': 'mapbox.streets',
                    },
                  ),
                  new MarkerLayerOptions(markers: [
                    new Marker(
                        width: 45.0,
                        height: 45.0,
                        point: new LatLng(lat, long),
                        builder: (context) => new Container(
                              child: IconButton(
                                icon: Icon(Icons.location_on),
                                color: Colors.red,
                                onPressed: () {
                                  print('Marker Tapped');
                                },
                              ),
                            ))
                  ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> _returnDistance() async {
    Dio dio = new Dio();
    Response response = await dio.get(
        "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=40.6655101,-73.89188969999998&destinations=40.6905615%2C-73.9976592&key=AIzaSyBoSkBHcwEaxqeuy9iBSca9B2wUxhtB1vU");
    print(response.data);
    return '${response.data}';
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
