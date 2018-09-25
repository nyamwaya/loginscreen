import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  Separator({this.margin, this.height, this.width, this.color});

  final EdgeInsetsGeometry margin;
  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: margin,
      height: height,
      width: width,
      color: color,
      // margin: new EdgeInsets.symmetric(vertical: 8.0),
      // height: 2.0,
      // width: 18.0,
      // color: new Color(0xFFfc5185),
    );
  }
}




