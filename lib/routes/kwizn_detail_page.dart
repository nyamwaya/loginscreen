import 'package:firebase_auth_world/widgets/PlanetSummary.dart';
import 'package:firebase_auth_world/widgets/map_kwizny.dart';
import 'package:firebase_auth_world/widgets/separator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth_world/widgets/kwizny_summary.dart';

class KwiznDetailPage extends StatefulWidget {
  KwiznDetailPage({
    this.title,
    this.address,
    this.cityState,
    this.pictureUrl,
    this.color,
    this.description,
    this.restaurant,
    /* Enable this if you choes to perform on tap the other way [See coment in kwiznyListPage] this.materialIndex: 500 */
  });

  final String title;
  final String address;
  final String cityState;
  final String pictureUrl;
  final MaterialColor color;
  final String description;
  final String restaurant;

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
//      appBar: new AppBar(
//        backgroundColor: Colors.red,
//        elevation: 0.0,
//        //centerTitle: true,
//        leading: new BackButton(color: Colors.white),
//        title: new Text(
//          widget.title,
//          style: TextStyle(
//              //  fontWeight: FontWeight.w800,
//              color: Colors.white,
//              // fontFamily: 'Quicksand',
//              fontSize: 20.0),
//        ),
//      ),
      body: Container(
        constraints: new BoxConstraints.expand(),
        color: Colors.white,
        child: new ListView(
          children: <Widget>[
            //_getToolbar(context),
            _heroImage(),
            _heading(),
            Separator(),
            //_buildSeparator(),
            reviews(),

            //newHero(),
            //art()

            //  _buildBackgroundImage(),
            //_myHero(),
            // _getCOntent(),
            // _buildHeader(),
            // _buildSeparator(),
            // _buildDescription(),
            // _buildSeparator(),
            // _buildSectionTitleText(),
            // MapKwizny(address: widget.address),
          ],
        ),
      ),
    );
  }

// Widget _getCOntent(){
//   return new ListView(
//     children: <Widget>[
//    //   _heroImage(),

//       PlanetSummary(widget.title, widget.address, widget.cityState, widget.pictureUrl, horizontal: false,),
//       new Container(
//         padding: new EdgeInsets.symmetric(horizontal: 0.0),
//         child: new Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[

//             // _buildHeader(),
//             // _buildSeparator(),
//             // _buildDescription(),
//             // _buildSeparator(),
//             // _buildSectionTitleText(),
//             // MapKwizny(address: widget.address),
//           ],
//         ),
//       )
//     ],
//   );
// }

  // Container _buildBackgroundImage() {
  //   return new Container(
  //     //  padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
  //     height: 208.0,
  //     child: new Card(
  //       // elevation: 10.0,
  //       child: new Column(
  //         children: <Widget>[
  //           new ClipRRect(
  //             borderRadius: new BorderRadius.circular(8.0),
  //             child: new Image.network(
  //               widget.pictureUrl,
  //               width: double.infinity,
  //               fit: BoxFit.cover,
  //               height: 200.0,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Container _heroImage() {
    return new Container(
      constraints: new BoxConstraints.expand(height: 200.0),
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new NetworkImage(widget.pictureUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: new Stack(
        children: <Widget>[
          new Positioned(
              child: new Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: new BackButton(
              color: Colors.white,
            ),
          )),
          new Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 155.0,
            //   height: 70.0,
            child: new Container(
              decoration: new BoxDecoration(
                  // borderRadius: new BorderRadius.circular(8.0),
                  gradient: new LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.8),
                ],
              )),
              padding: const EdgeInsets.all(24.0),
              child: new Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _heading() {
    return Container(
        padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        margin: EdgeInsets.only(
          right: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  widget.title,
                  style: const TextStyle(
                    letterSpacing: 1.0,
                    color: Color(0xff192865),
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    //fontFamily: 'Quicksand'
                  ),
                ),
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                      color: Color(0xfffc4041),
                      boxShadow: [
                        new BoxShadow(
                            color: Color(0xfffc4041), blurRadius: 16.0)
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("5",
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      new Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 16.0,
                      ),
                    ],
                  ),
                )
              ],
            ),
            new Text(
              widget.cityState,
              style: const TextStyle(
                color: Color(0xff192865),
                fontSize: 14.0,
                //fontFamily: 'Quicksand',
                // fontWeight: FontWeight.w500,
                letterSpacing: 1.0,
              ),
            ),
            Container(
              height: 12.0,
            ),
            RichText(
              text: new TextSpan(
                  style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.black38,
                  ),
                  children: <TextSpan>[
                    new TextSpan(
                        text: "Hill Road, West Baston, Centaral Japan"),
                    new TextSpan(
                      text: '\nClosed In 45 minutes',
                      style: new TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xfffc4041),
                          fontWeight: FontWeight.bold),
                    ),
                    new TextSpan(
                        text:
                            " 11AM to 12Midnight (Today) \nCasual Dining - Chinese, Pizza"),
                  ]),
            ),
            Container(height: 12.0),
            directionButton()

            //submit button
          ],
        ));
  }

  Widget directionButton() {
    return OutlineButton(
      //textColor: Color(0xfffc4041),
      child: Text(
        "Directions",
        style: TextStyle(color: Color(0xfffc4041),fontFamily: 'sofiapro'),
      ),
      color: Color(0xfffc4041),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(8.0)),
      onPressed: null,
      disabledBorderColor: Color(0xfffc4041),
    );
  }

  Widget reviews() {
    return Container(
      padding: EdgeInsets.only(top: 0.0, left: 16.0, right: 16.0),
      margin: EdgeInsets.only(
        right: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Reviews",
                style: const TextStyle(
                  letterSpacing: 1.0,
                  color: Color(0xff192865),
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'sofiapro'
                  //fontFamily: 'Quicksand'
                ),
              ),
              Text("Read all (400)",
                  style: const TextStyle(
                    letterSpacing: 1.0,
                    color: Color(0xfffc4041),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'sofiapro'
                    //fontFamily: 'Quicksand'
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[userComentBlock(), userComentReview()],
          ),
          Container(
            margin: EdgeInsets.only(top: 12),
            child: Text("Lorem ipsum dolor sit amet, consecteur adipisicing \nelit,sed do eiusmod tempor incididunt ut labore et \ndolore magna aliqua",
            style: TextStyle(
              fontSize: 14.0,
              fontFamily: 'sofiapro',
              color: Colors.black54
              

            ),)
 ,
          )

        ],
      ),
    );
  }

  Row userComentBlock() {
    return Row(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: 24.0),
            width: 50.0,
            height: 50.0,
            decoration: new BoxDecoration(
              color: const Color(0xff7c94b6),
              boxShadow: [
                new BoxShadow(color: Colors.black38, blurRadius: 8.0)
              ],
              image: new DecorationImage(
                //TODO: if not profile photo, add random robot
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1531078215167-91fcfe45b39e?ixlib=rb-0.3.5&s=786d61b2a3ed74d1f981ee230b1a9457&auto=format&fit=crop&w=1098&q=80.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
              //border: new Border.all(color: Color(0xfffc4041), width: 4.0)
            )),
        new Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 20.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Tara Davis",
                style: TextStyle(color: Colors.black, fontSize: 16.0,fontFamily: 'sofiapro'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: new Text(
                  "45 Reviews, 353 Followers",
                  style: TextStyle(color: Colors.black54, fontSize: 14.0,fontFamily: 'sofiapro'),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Container userComentReview() {
    return Container(
      margin: EdgeInsets.only(top: 12),
      child: //comenter
          Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 60.0,
                height: 40.0,
                decoration: BoxDecoration(
                    color: Color(0xfffc4041),
                    boxShadow: [
                      new BoxShadow(color: Color(0xfffc4041), blurRadius: 8.0)
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("5",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'sofiapro',
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    new Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 16.0,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  // Container _buildHeader() {
  //   return new Container(
  //     child: new Padding(
  //       padding: const EdgeInsets.only(top: 0.0),
  //       child: new Column(children: <Widget>[
  //         new Column(
  //           children: <Widget>[
  //             new Row(
  //               children: <Widget>[
  //                 new Expanded(
  //                     child: new Padding(
  //                   padding: const EdgeInsets.all(12.0),
  //                   child: new Column(
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: <Widget>[
  //                       new Text(
  //                         widget.title,
  //                         style: const TextStyle(
  //                           letterSpacing: 1.0,
  //                           color: Colors.black,
  //                           fontSize: 24.0,
  //                           //fontWeight: FontWeight.w400,
  //                           //fontFamily: 'Quicksand'
  //                         ),
  //                       ),
  //                       new Text(
  //                         widget.cityState,
  //                         style: const TextStyle(
  //                           color: Colors.black87,
  //                           fontSize: 14.0,
  //                           fontFamily: 'Quicksand',
  //                           fontWeight: FontWeight.w500,
  //                           letterSpacing: 1.0,
  //                         ),
  //                       ),
  //                       new Container(
  //                         child: new Row(
  //                           crossAxisAlignment: CrossAxisAlignment.center,
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           children: <Widget>[
  //                             new Container(
  //                               padding: EdgeInsets.only(top: 24.0),
  //                             ),
  //                             Card(
  //                                 color: Color(0xFFE1E6E7),
  //                                 elevation: 8.0,
  //                                 child: new Padding(
  //                                   padding: EdgeInsets.all(12),
  //                                   child: new Text("10 Mins"),
  //                                 )),
  //                             Card(
  //                                 color: Color(0xFFE9E5FF),
  //                                 elevation: 8.0,
  //                                 child: Padding(
  //                                   padding: EdgeInsets.all(12),
  //                                   child: new Text("Vegan"),
  //                                 ))
  //                           ],
  //                         ),
  //                         // child: new Text(
  //                         //   widget.cityState,
  //                         //   style: const TextStyle(
  //                         //     color: Colors.black87,
  //                         //     fontSize: 14.0,
  //                         //     fontFamily: 'Quicksand',
  //                         //     fontWeight: FontWeight.w500,
  //                         //     letterSpacing: 1.0,
  //                         //   ),
  //                         // ),
  //                       ),
  //                       new Container(
  //                         padding: EdgeInsets.only(top: 16.0),
  //                       ),
  //                       new Text(
  //                         "12.00 \$",
  //                         style: const TextStyle(
  //                           letterSpacing: 1.0,
  //                           color: Colors.black,
  //                           fontSize: 20.0,
  //                           //fontWeight: FontWeight.w400,
  //                           //fontFamily: 'Quicksand'
  //                         ),
  //                       ),
  //                       new Container(
  //                           padding: EdgeInsets.all(24.0),
  //                           child: new Text(
  //                               "Only spot in the twin cities where you can get rolled ice cream in a cone! 😍🍦"))
  //                     ],
  //                   ),
  //                 )),
  //               ],
  //             ),
  //           ],
  //         )
  //       ]),
  //     ),
  //   );
  // }

  // Container _buildSeparator() {
  //   return Container(
  //     padding: const EdgeInsets.only(left: 0.0, right: 0.0),
  //     child: Separator(
  //       margin: new EdgeInsets.symmetric(vertical: 24.0),
  //       height: 1.0,
  //       width: double.infinity,
  //       color: Colors.black12,
  //     ),
  //   );
  // }

  Container _buildDescription() {
    return Container(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: new Text(
        widget.description,
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

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: new BackButton(color: Colors.red),
    );
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
