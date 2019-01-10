import 'package:flutter/material.dart';
import 'package:firebase_auth_world/widgets/RateButton.dart';
import 'package:firebase_auth_world/widgets/separator.dart';
import 'package:firebase_auth_world/routes/CommentAndRateScreen.dart';
import 'package:firebase_auth_world/routes/KwiznyListPage.dart';


class AddPhotoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddPhotoScreen();
}

class _AddPhotoScreen extends State<AddPhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          _getToolbar(context),
          giveYourRating(),
          Separator(),
          commentSection(),
          // uploadPicture(),
          nextButton()
        ],
      ),
    ));
  }

  Widget giveYourRating() {
    return Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Give your rating",
              style: TextStyle(
                  color: Color(0xff47495E),
                  fontFamily: 'sofiapro',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 12),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: RateButton(
                      text: '1',
                      buttonWidth: 54,
                      icon: Icon(
                        Icons.star,
                        size: 14,
                        color: Color(0xfffc4041),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: RateButton(
                      text: '2',
                      buttonWidth: 54,
                      icon: Icon(
                        Icons.star,
                        size: 14,
                        color: Color(0xfffc4041),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: RateButton(
                      text: '3',
                      buttonWidth: 54,
                      icon: Icon(
                        Icons.star,
                        size: 14,
                        color: Color(0xfffc4041),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: RateButton(
                      text: '4',
                      buttonWidth: 54,
                      icon: Icon(
                        Icons.star,
                        size: 14,
                        color: Color(0xfffc4041),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: RateButton(
                      text: '5',
                      buttonWidth: 54,
                      icon: Icon(
                        Icons.star,
                        size: 14,
                        color: Color(0xfffc4041),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.0, bottom: 8),
              child: Text(
                "Outstanding!",
                style: TextStyle(
                    color: Color(0xfffd4241),
                    fontFamily: 'sofiapro',
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            )
          ],
        ));
  }

  Widget commentSection() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: Text(
                "Give more information to your \nfreinds about the environment, the\nfood...",
                style: TextStyle(
                    color: Color(0xff47495E),
                    fontFamily: 'sofiapro',
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  border: Border.all(color: Colors.grey)),
              child: TextField(
                maxLines: 3,
                decoration: InputDecoration(

                    //labelText: 'Enter your review',
                    // border: OutlineInputBorder(
                    //     borderRadius: BorderRadius.all(Radius.circular(1.0))),
                    filled: true,
                    hintStyle: new TextStyle(color: Colors.grey[800]),
                    hintText: "Your review goes here",
                    fillColor: Colors.white70,
                    counterText: '(160 max)'),
              ),
            )
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
          // Icon(
          //   Icons.close,
          //   color: Colors.grey,
          // ),

          new IconButton(
             icon: new Icon(Icons.close),
            onPressed: () =>               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KwiznyListPage()),
              ),
           ),
        ],
      ),
    );
  }

//   Widget nextButton() {
//     return FlatButton(
//       child: Text("Next"),
//       color: Color(0xfffc4041),
//       shape: new RoundedRectangleBorder(
//           borderRadius: new BorderRadius.circular(8.0)),
//       onPressed: null,
//       // disabledBorderColor: Color(0xfffc4041),
//     );
//   }
// }

  Widget nextButton() {
    return Container(
        margin: EdgeInsets.only(top: 24),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color(0xfffee9eb),
            blurRadius: 28.0,
            offset: Offset(0, 0),
            //    spreadRadius: -10,
          ),
        ]),
        child: RaisedButton(
          child: const Text(
            'Next',
          ),
          textColor: Colors.white,
          color: Color(0xfffc4041),
          elevation: 4.0,
          splashColor: Color(0xff192865),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CommentAndRateScreen()),
            );
          },
        ));
  }
}
