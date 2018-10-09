import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoder/geocoder.dart';
import 'package:latlong/latlong.dart';

class MapKwizny extends StatefulWidget {
  MapKwizny({this.address});

  final String address;

  @override
  State<StatefulWidget> createState() => _MapKwiznyState();
}

class _MapKwiznyState extends State<MapKwizny> {
  double lat;
  double long;
  MapController mapController;
  var first;

  @override
  void initState() {
    super.initState();
    _setLatLong();
  }

  Future _setLatLong() async {
    var addresses = await Geocoder.local.findAddressesFromQuery(widget.address);

    setState(() {
   
      lat = addresses.first.coordinates.latitude;
      long = addresses.first.coordinates.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 218.0,
        child: new Card(
          color: Colors.red,
          elevation: 10.0,
          child: new Column(
            children: [
              new Flexible(
                //fit: BoxFit.cover,
                child: new FlutterMap(
                  mapController: mapController,
                  options: new MapOptions(
                      //minZoom: 10.0,
                      center: LatLng(lat, long),
                      zoom: 13.0),
                  layers: [
                    TileLayerOptions(
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
              new FlatButton(
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () => {
                      //TODO: Launch default map app
                    },
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.time_to_leave),
                    Text("Open in Maps",
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w800))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
