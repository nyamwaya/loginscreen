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
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[newsFeedHeader(), newsFeedImage(), newsFeedFotter()],
      ),
    );
  }

  Container newsFeedImage() {
    return Container(
      height: 300,
      width: 800,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xfffee9eb), 
              blurRadius: 12.0,
              offset: Offset(1, 28),
              spreadRadius: -10,
              ),
          ],
          borderRadius: BorderRadius.circular(4.0),
          image: DecorationImage(
              image: NetworkImage(headImmageAssetpath), fit: BoxFit.cover)),
    );
  }

  Widget _buildImageCard() {
    return Card(
      //elevation: 6.0,
      child: new Stack(
        children: <Widget>[
          //This loads an immage from the netwrok. Used on prod version of app

          new ClipRRect(
            borderRadius: new BorderRadius.circular(8.0),
            child: new ImageURILoader(
              imageUri: headImmageAssetpath,
              width: double.infinity,
              height: 250.0,
              fit: BoxFit.cover,
            ),
          ),

          // _buildKwiznSynopsis(),

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
              // new Expanded(
              //     child: new Padding(
              //   padding: const EdgeInsets.all(15.0),
              //   child: new Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: <Widget>[
              //       new Text(
              //         title,
              //         style: const TextStyle(
              //             fontSize: 25.0, fontFamily: 'Quicksand'),
              //       ),
              //       new Text(
              //         subtitle,
              //         style: const TextStyle(
              //             fontSize: 16.0,
              //             fontFamily: 'Quicksand',
              //             letterSpacing: 1.0,
              //             color: const Color(0xffAAAAAA)),
              //       )
              //     ],
              //   ),
              // )),

              // new Container(
              //   width: 2.0,
              //   height: 70.0,
              //   decoration: new BoxDecoration(
              //       gradient: new LinearGradient(colors: [
              //     Colors.white,
              //     Colors.white,
              //     const Color(0xFFAAAAAA),
              //   ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              // ),

              // Padding(
              //   padding: const EdgeInsets.only(left: 8.0, right: 15.0),
              //   child: new Column(
              //     children: <Widget>[
              //       new Icon(
              //         Icons.favorite_border,
              //         color: Colors.red,
              //       ),
              //       new Text(
              //         "$heartCoutn",
              //       )
              //     ],
              //   ),
              // )
            ],
          )
        ],
      ),
    );
  }

  Row newsFeedHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[userTitle(), whatsTheRate()],
    );
  }

  Container userTitle() {
    return Container(
        child: Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        children: <Widget>[
          Container(
            //margin: EdgeInsets.only(bottom: 12),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1531078215167-91fcfe45b39e?ixlib=rb-0.3.5&s=786d61b2a3ed74d1f981ee230b1a9457&auto=format&fit=crop&w=1098&q=80.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Tara Davis",
                  style: TextStyle(
                      fontFamily: 'sofiapro',
                      fontSize: 20,
                      color: Color(0xff192865),
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Text(
                    "Rated a new kwizn",
                    style: TextStyle(color: Colors.grey,fontFamily: 'sofiapro'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.access_time,
                        size: 15,
                        color: Colors.grey.shade400,
                      ),
                      new Container(
                        width: 4,
                      ),
                      Text("Posted 2 hours ago",
                          style: TextStyle(color: Colors.grey.shade400, fontFamily: 'sofiapro'))
                    ],
                  ),
                )
              ],
            ),
          ),
          //whatsTheRate()
        ],
      ),
    ));
  }

  Container whatsTheRate() {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(8),
            //padding: EdgeInsets.only(bottom: 8),
            //alignment: Alignment(0.5, 1.0),
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
                color: Color(0xfffee9eb),
                // boxShadow: [
                //   new BoxShadow(
                //       color: Color(0xfffc4041), blurRadius: 16.0)
                // ],
                borderRadius: BorderRadius.all(Radius.circular(50.0))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("5",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'sofiapro',
                        fontWeight: FontWeight.bold,
                        color: Color(0xfffc4041))),
                new Icon(
                  Icons.star,
                  color: Color(0xfffc4041),
                  size: 16.0,
                ),
              ],
            ),
          ),
          Text(
            "Outstanding!",
            style: TextStyle(
                color: Color(0xfffd4241), fontWeight: FontWeight.bold, fontFamily: 'sofiapro'),
          )
        ],
      ),
    );
  }

  Padding newsFeedFotter() {
    return Padding(
      padding: EdgeInsets.only(top: 32, bottom: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.favorite_border,
                  color: Color(0xfffc4041),
                  size: 28,
                ),
                Container(
                  width: 8,
                ),
                Text(
                  "251 Likes",
                  style: TextStyle(
                      color: Color(0xff192865),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'sofiapro',
                      fontSize: 18),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.mode_comment,
                  color: Colors.grey.shade300,
                  size: 28,
                ),
                Container(
                  width: 8,
                ),
                Text(
                  "450 Coments",
                  style: TextStyle(
                      color: Colors.grey.shade500,
                      fontFamily: 'sofiapro',
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildKwiznSynopsis() {
    return new Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: new Container(
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(8.0),
            gradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.8),
              ],
            )),
        padding: const EdgeInsets.all(24.0),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        fontFamily: 'sofiapro'),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'sofiapro',
                        letterSpacing: 1.0,
                        color: const Color(0xffAAAAAA)),
                  ),
                ],
              ),
            ),
            new Icon(
              Icons.favorite_border,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
