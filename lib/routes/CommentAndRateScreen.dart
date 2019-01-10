import 'package:flutter/material.dart';
import 'package:firebase_auth_world/routes/AddPhotoScreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth_world/widgets/separator.dart';
import 'package:firebase_auth_world/widgets/RateButton.dart';

class CommentAndRateScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CommentAndRateScreen();
}

class _CommentAndRateScreen extends State<CommentAndRateScreen> {
  FileImage _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          _getToolbar(context),
          //giveYourRating(),
          //   Separator(),
          //   commentSection(),

          // previewImage(),

          // previewImageList(),

          _getPicturePreview(),

          uploadPicture(),

          Separator(),

          //_test(),
          //myGridview(),
          rating(),
          _getTagList(),
          // tagList(),
          //tagButton(),
          Separator(),
          nextButton()
        ],
      ),
    ));
  }

  _getPicturePreview() {
    var horizontalList = new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: previewImage(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: previewImage(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: previewImage(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: previewImage(),
            ),
          ][index];
        },
        itemCount: 4);

    return new Container(
        width: double.infinity, height: 180.0, child: horizontalList);
  }

  _getTagList() {
    var horizontalList = new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: tagButton()),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: tagButton()),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: tagButton()),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: tagButton()),
          ][index];
        },
        itemCount: 4);

    return new Container(
        width: double.infinity,
        height: 32.0,
        margin: EdgeInsets.only(top: 16),
        child: horizontalList);
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
          //   Icons.arrow_back,
          //   color: Colors.grey,
          // ),

          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
            //     tooltip: 'Increase volume by 10%',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddPhotoScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget previewImage() {
    return Container(
      width: 300,

      // height: 20,
      //padding: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://scontent-msp1-1.cdninstagram.com/vp/8865367a4a8d9469638cdb25dc4fb56d/5CC69E59/t51.2885-15/sh0.08/e35/s640x640/47690559_130880774606029_8174786043930327404_n.jpg?_nc_ht=scontent-msp1-1.cdninstagram.com'),
          fit: BoxFit.cover,
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black,
        //     blurRadius: 8.0,
        //     // offset: Offset(1, 28),
        //     // spreadRadius: -10,
        //   ),
        // ],
        // borderRadius: new BorderRadius.all(new Radius.circular(0.0)),
      ),
    );
  }

  Widget rating() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(),
            child: Text(
              "Add tag to make search easier",
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff192865),
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  Widget uploadPicture() {
    return Container(
      //padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 16),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 12.0),
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
                new Icon(
                  Icons.photo,
                  color: Color(0xfffc4041),
                  size: 24.0,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Add a picture",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }

  Widget tagButton() {
    return Container(
      // width: 24,
      // padding: EdgeInsets.all(16),
      child: OutlineButton(
        //textColor: Color(0xfffc4041),
        //padding: EdgeInsets.all(value),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Burito",
              style: TextStyle(
                  color: Color(0xfffd4241),
                  fontFamily: 'sofiapro',
                  fontSize: 16),
            ),
          ],
        ),
        color: Color(0xfffc4041),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(8.0)),
        onPressed: null,
        disabledBorderColor: Color(0xfffc4041),
      ),
    );
  }

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
          padding: EdgeInsets.all(16),
          child: const Text(
            'Add Your Review',
          ),
          textColor: Colors.white,
          color: Color(0xfffc4041),
          elevation: 4.0,
          splashColor: Color(0xff192865),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CommentAndRateScreen()),
            );
          },
        ));
  }
}
