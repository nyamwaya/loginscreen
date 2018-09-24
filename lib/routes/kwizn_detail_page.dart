

import 'package:flutter/material.dart';

class KwiznDetailpage extends StatelessWidget {
  KwiznDetailpage({this.title, this.address, this.cityState, this.pictureUrl, this.color, this.materialIndex: 500});
  final String title;
  final String address; 
  final String cityState;
  final String pictureUrl;
  final MaterialColor color;
  final int materialIndex;
 

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(
          '$title[$materialIndex]',
        ),
      ),
      body: Container(
        color: color[materialIndex],
      ),
    );
  }
}
