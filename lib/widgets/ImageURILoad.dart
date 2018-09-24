import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*
  This class is responsible for dispalying an image just in case if we want to display a  place holder? 
  probably a useless extrapolation. 
*/

class ImageURILoader extends StatelessWidget {
  final String imageUri;
  final double height;
  final double width;
  final BoxFit fit;
  Image image;

  ImageURILoader({this.imageUri, this.height, this.width, this.fit});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Image.network(
      imageUri,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
