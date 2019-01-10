import 'package:firebase_auth_world/model/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth_world/widgets/ProfilePreview.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({this.displaName, this.auth, this.onSignedOut});

  final String displaName;
  final BaseAuth auth;
  final VoidCallback onSignedOut;

  @override
  State<StatefulWidget> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  void _signOut() async {
    //TODO: implement auto sign user out if userId is not valid
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: new AppBar(
      //   backgroundColor: Colors.red,
      //   elevation: 0.0,
      //   title: new Text(
      //     "Profile",
      //     style: TextStyle(color: Colors.white, fontSize: 20.0),
      //   ),
      //   actions: <Widget>[
      //     new FlatButton(
      //         child: new Icon(
      //           Icons.exit_to_app,
      //           color: Colors.white,
      //         ),
      //         onPressed: _signOut)
      //   ],
      // ),
      //     body: GridView.builder(
      //   itemBuilder: (context, position) {
      //     return ProfilePreviewCard(
      //       pictureUrl:
      //           'https://scontent-msp1-1.cdninstagram.com/vp/06e91915dec202584d804c7b0abd02ae/5CD490FF/t51.2885-15/sh0.08/e35/p640x640/47586487_1998839940408668_8747226142384423496_n.jpg?_nc_ht=scontent-msp1-1.cdninstagram.com',
      //       kwizinTitle: 'Tropical Fruit',
      //       KwizinLocation: 'SanFransisco, Ca',
      //       fiveStarRating: '5',
      //     );
      //   },
      //   itemCount: 10,
      //   gridDelegate:
      //       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      // )
      body: Container(
        constraints: new BoxConstraints.expand(),
        child: new ListView(
          //physics: ClampingScrollPhysics(),

          // mainAxisAlignment: MainAxisAlignment.start,
          //padding: const EdgeInsets.all(1.0),
          children: <Widget>[
            //_buildHeader(),
            profilePicture(),
            followerBar(),
            SizedBox(height: 30.0),
            mainContent(),
            //_buildStatsBar(),
            // _buildOptions()
          ],
        ),
      ),
    );
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
      color: Colors.white,
      margin:
          EdgeInsets.only(top: MediaQuery.of(context).padding.top, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //   HomeBut(color: Colors.grey),
          Icon(
            Icons.menu,
            color: Colors.grey,
          ),

          Icon(
            Icons.edit,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  GridView myGridview() {
    return GridView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),

      //  / padding: EdgeInsets.all(200),
      itemBuilder: (context, position) {
        return ProfilePreviewCard(
          pictureUrl:
              'https://scontent-msp1-1.cdninstagram.com/vp/06e91915dec202584d804c7b0abd02ae/5CD490FF/t51.2885-15/sh0.08/e35/p640x640/47586487_1998839940408668_8747226142384423496_n.jpg?_nc_ht=scontent-msp1-1.cdninstagram.com',
          kwizinTitle: 'Tropical Fruit',
          KwizinLocation: 'SanFransisco, Ca',
          fiveStarRating: '5',
        );
      },
      itemCount: 10,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }

  Container followerBar() {
    return Container(
      //padding: EdgeInsets.only(top: 16, left: 20, right: 20, bottom: 16),
      padding: EdgeInsets.only(top: 24, bottom: 0),
      margin: EdgeInsets.only(right: 32, left: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                "121K",
                style: TextStyle(
                    color: Color(0xfffc4041),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: Text(
                  "Followers",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      color: Colors.grey),
                ),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                "152",
                style: TextStyle(
                    color: Color(0xfffc4041),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: Text(
                  "Following",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      color: Colors.grey),
                ),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                "455",
                style: TextStyle(
                    color: Color(0xfffc4041),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: Text(
                  "Kwizins",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      color: Colors.grey),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Container mainContent() {
    return Container(
      padding: EdgeInsets.only(top: 16, right: 16, left: 16),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "My Kwizins",
                style: TextStyle(
                    color: Color(0xff192865),
                    fontWeight: FontWeight.w500,
                    //fontFamily: 'Quicksand',
                    fontSize: 24.0),
              ),
              Text(
                "My Wishlist",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    //fontFamily: 'Quicksand',
                    fontSize: 24.0),
              ),
            ],
          ),
          // profilePreViewCard()
          // myGridview(),
          GridView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),

            //  / padding: EdgeInsets.all(200),
            itemBuilder: (context, position) {
              return ProfilePreviewCard(
                pictureUrl:
                    'https://scontent-msp1-1.cdninstagram.com/vp/06e91915dec202584d804c7b0abd02ae/5CD490FF/t51.2885-15/sh0.08/e35/p640x640/47586487_1998839940408668_8747226142384423496_n.jpg?_nc_ht=scontent-msp1-1.cdninstagram.com',
                kwizinTitle: 'Tropical Fruit',
                KwizinLocation: 'SanFransisco, Ca',
                fiveStarRating: '5',
              );
            },
            itemCount: 10,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          )

          // GridView.count(
          //     crossAxisCount: 2,
          //     children: List.generate(100, (index) {
          // ProfilePreviewCard(
          //   pictureUrl:
          //       'https://scontent-msp1-1.cdninstagram.com/vp/06e91915dec202584d804c7b0abd02ae/5CD490FF/t51.2885-15/sh0.08/e35/p640x640/47586487_1998839940408668_8747226142384423496_n.jpg?_nc_ht=scontent-msp1-1.cdninstagram.com',
          //   kwizinTitle: 'Tropical Fruit',
          //   KwizinLocation: 'SanFransisco, Ca',
          //   fiveStarRating: '5',
          // ),

          //     }))
        ],
      ),
    );
  }

  // Card profilePreViewCard() {
  //   return Card(
  //       margin: EdgeInsets.all(8),
  //       elevation: 8,
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: <Widget>[
  //           Container(
  //               //padding: EdgeInsets.all(100),
  //               margin: EdgeInsets.all(12),
  //               width: 152,
  //               height: 104,
  //               decoration: new BoxDecoration(
  //                   borderRadius: BorderRadius.circular(4.0),
  //                   image: DecorationImage(
  //                       image: NetworkImage(
  //                           'https://scontent-msp1-1.cdninstagram.com/vp/06e91915dec202584d804c7b0abd02ae/5CD490FF/t51.2885-15/sh0.08/e35/p640x640/47586487_1998839940408668_8747226142384423496_n.jpg?_nc_ht=scontent-msp1-1.cdninstagram.com'),
  //                       fit: BoxFit.cover)),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.end,
  //                 crossAxisAlignment: CrossAxisAlignment.end,
  //                 children: <Widget>[
  //                   Container(
  //                     margin: EdgeInsets.all(12),
  //                     //alignment: Alignment(0.5, 1.0),
  //                     width: 30.0,
  //                     height: 30.0,
  //                     decoration: BoxDecoration(
  //                         color: Colors.white,
  //                         // boxShadow: [
  //                         //   new BoxShadow(
  //                         //       color: Color(0xfffc4041), blurRadius: 16.0)
  //                         // ],
  //                         borderRadius:
  //                             BorderRadius.all(Radius.circular(50.0))),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: <Widget>[
  //                         Text("5",
  //                             style: TextStyle(
  //                                 fontSize: 12.0,
  //                                 fontWeight: FontWeight.bold,
  //                                 color: Color(0xfffc4041))),
  //                         new Icon(
  //                           Icons.star,
  //                           color: Color(0xfffc4041),
  //                           size: 12.0,
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               )),
  //           Padding(
  //             padding: EdgeInsets.only(left: 16),
  //             child: Text("Tropical Fruits",
  //                 style: TextStyle(
  //                     color: Color(0xff192865),
  //                     fontWeight: FontWeight.w500,
  //                     //fontFamily: 'Quicksand',
  //                     fontSize: 14.0)),
  //           ),
  //           Padding(
  //               padding: EdgeInsets.only(top: 4.0, bottom: 12, left: 16),
  //               child: Row(
  //                 mainAxisSize: MainAxisSize.min,
  //                 //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: <Widget>[
  //                   Text(
  //                     "San Francisco, Ca",
  //                     style: TextStyle(
  //                         color: Colors.grey,
  //                         fontWeight: FontWeight.w500,
  //                         //fontFamily: 'Quicksand',
  //                         fontSize: 12.0),
  //                   ),
  //                   // Text(
  //                   //   "1d",
  //                   //   textAlign: TextAlign.end,
  //                   //   style: TextStyle(
  //                   //       color: Colors.grey,
  //                   //       fontWeight: FontWeight.w500,

  //                   //       //fontFamily: 'Quicksand',
  //                   //       fontSize: 12.0),
  //                   // ),
  //                 ],
  //               )),
  //         ],
  //       ));
  // }

  Container profilePicture() {
    return Container(
      color: Colors.white,
      //margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.only(bottom: 24, right: 16, left: 16),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _getToolbar(context),
          new Container(
              width: 100.0,
              height: 100.0,
              decoration: new BoxDecoration(
                  color: const Color(0xff7c94b6),
                  // boxShadow: [
                  //   new BoxShadow(color: Colors.black38, blurRadius: 32.0)
                  // ],
                  image: new DecorationImage(
                    //TODO: if not profile photo, add random robot
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1531078215167-91fcfe45b39e?ixlib=rb-0.3.5&s=786d61b2a3ed74d1f981ee230b1a9457&auto=format&fit=crop&w=1098&q=80.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
                  border: new Border.all(color: Colors.white, width: 4.0))),
          new Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 15.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Tara Davis",
                  style: TextStyle(
                      color: Color(0xff192865),
                      fontWeight: FontWeight.w500,
                      //fontFamily: 'Quicksand',
                      fontSize: 20.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              size: 15,
                              color: Colors.black45,
                            ),
                            new Text(
                              "Minneapolis",
                              style: TextStyle(
                                  //fontWeight: FontWeight.w600,
                                  //fontFamily: 'Quicksand',
                                  color: Colors.black45,
                                  fontSize: 14.0),
                            ),
                          ],
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _buildHeader() {
    return new Container(
      color: Colors.white,
      // width: ,
      // padding: const EdgeInsets.only(left: 16.0, bottom: 24.0, top: 25.0),
      //height: 218.0,
    );
  }

  Container _buildStatsBar() {
    return Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        height: 100.0,
        //color: Colors.white,
        child: Card(
          elevation: 1.0,
          child: Row(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      '353',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w800),
                    ),
                    new Text(
                      "Kwizins",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black38,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Quicksand',

                        //fontWeight: FontWeight.w800
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      '12K',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w800),
                    ),
                    new Text(
                      "Views",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black38,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Quicksand',

                        //fontWeight: FontWeight.w800
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 35.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          '1.4k',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w800),
                        ),
                        new Text(
                          "Followers",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black38,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Quicksand',
                            //fontWeight: FontWeight.w800
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Container _buildOptions() {
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        children: <Widget>[
          ListTile(
            trailing: Icon(Icons.feedback),
            onTap: () => {/*TODO: log me out*/},
            title: Text('Feedbck',
                style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: 'Quicksand',
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                )),
          ),
          // ListTile(
          //   trailing: Icon(Icons.exit_to_app),
          //   onTap: (_signOut),
          //   title: Text('Logout',
          //       style: TextStyle(
          //         fontSize: 24.0,
          //         fontFamily: 'Quicksand',
          //         color: Colors.redAccent,
          //         fontWeight: FontWeight.w500,
          //       )),
          // ),
        ],
      ),
    ));
  }
}
