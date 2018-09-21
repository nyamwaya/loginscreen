import 'package:flutter/material.dart';

class ImageURILoader extends StatelessWidget {
  final String imageUri;
  final double height;
  final double width;
  final BoxFit fit;

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