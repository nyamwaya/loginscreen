import 'dart:async';

import 'package:firebase_auth_world/widgets/ImageURILoad.dart';
import 'package:flutter/material.dart';

//This is the card of a kwizni

class Restaurantcard extends StatelessWidget {
  final String headImmageAssetpath;
  final String title;
  final String subtitle;
  final int heartCoutn;

  Restaurantcard(
      {this.headImmageAssetpath, this.title, this.subtitle, this.heartCoutn});

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Card(
        elevation: 10.0,
        child: new Column(
          children: <Widget>[
            //This loads an immage from the netwrok. Used on prod version of app
            new ImageURILoader(
              imageUri: headImmageAssetpath,
              width: double.infinity,
              height: 250.0,
              fit: BoxFit.cover,
            ),

            // for loadign local assets..used when you do local debug
            //new Image.asset(
            //   headImmageAssetpath,
            //   width: double.infinity,
            //   height: 250.0,
            //   fit: BoxFit.cover,
            // ),
            new Row(
              children: <Widget>[
                //  TODO: Maybe use this code to highlight if a meal has a specialty eg. Gluten free
                //  This is an Icon to the left of the text int he card
                // new Padding(
                //     padding: const EdgeInsets.all(15.0),
                //     child: new Container(
                //       padding: const EdgeInsets.all(10.0),
                //       decoration: new BoxDecoration(
                //           color: Colors.red,
                //           borderRadius: new BorderRadius.all(
                //               const Radius.circular(15.0))),
                //       child: new Icon(
                //         Icons.fastfood,
                //         color: Colors.white,
                //       ),
                //     )),
                new Expanded(
                  child: new Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        title,
                        style: const TextStyle(
                            fontSize: 25.0, fontFamily: 'Quicksand'),
                      ),
                      new Text(
                        subtitle,
                        style: const TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Quicksand',
                            letterSpacing: 1.0,
                            color: const Color(0xffAAAAAA)),
                      )
                    ],
                  ),
                )),

                new Container(
                  width: 2.0,
                  height: 70.0,
                  decoration: new BoxDecoration(
                      gradient: new LinearGradient(colors: [
                    Colors.white,
                    Colors.white,
                    const Color(0xFFAAAAAA),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 15.0),
                  child: new Column(
                    children: <Widget>[
                      new Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      ),
                      new Text(
                        "$heartCoutn",
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}