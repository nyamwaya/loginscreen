import 'package:flutter/material.dart';
import 'package:firebase_auth_world/routes/kwizn_detail_page.dart';
import 'package:firebase_auth_world/style.dart';
import 'package:firebase_auth_world/widgets/separator.dart';

class PlanetSummary extends StatelessWidget {
  // final Planet planet;
  final bool horizontal;
  final String title;
  final String address;
  final String cityState;
  final String pictureUrl;

  PlanetSummary(this.title, this.address, this.cityState, this.pictureUrl,
      {this.horizontal = true});
  PlanetSummary.vertical(
      this.title, this.address, this.cityState, this.pictureUrl)
      : horizontal = false;

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = new Container(
      margin: new EdgeInsets.symmetric(vertical: 16.0),
      alignment:
          horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: new Hero(
        tag: "planet-hero-${pictureUrl}",
        child: new Image(
          image: new NetworkImage(pictureUrl),
          height: 92.0,
          width: 92.0,
        ),
      ),
    );

    Widget _planetValue({String value, String image}) {
      return new Container(
        child: new Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          new Image.asset(image, height: 12.0),
          new Container(width: 8.0),
          new Text(title, style: Style.smallTextStyle),
        ]),
      );
    }

    final planetCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(
          horizontal ? 76.0 : 16.0, horizontal ? 0.0 : 12.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Expanded(
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Text(title,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black)),
              new Container(height: 4.0),
              new Text(
                cityState,
                style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              new Container(height: 16.0),

              new Text("Only spot in the twin cities where you can get rolled ice cream in a cone! 😍🍦")
            ],
          )),
        ],
      ),
    );

    final planetCard = new Container(
      child: planetCardContent,
      //change this to be a height of wrap content or min
      height: horizontal ? 124.0 : 154.0,
      margin: horizontal
          ? new EdgeInsets.only(left: 46.0)
          : new EdgeInsets.only(top: 72.0),
      decoration: new BoxDecoration(
        color: Colors.white, //new Color(0xFF333366)
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return new GestureDetector(
        onTap: horizontal
            ? () => Navigator.of(context).push(
                  new PageRouteBuilder(
                    pageBuilder: (_, __, ___) => new KwiznDetailPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation,
                            child) =>
                        new FadeTransition(opacity: animation, child: child),
                  ),
                )
            : null,
        child: new Container(
          
          margin: const EdgeInsets.symmetric(
            vertical: 52.0,
            horizontal: 24.0,
          ),
          child: new Stack(
            children: <Widget>[
              planetCard,
              //planetThumbnail,
            ],
          ),
        ));
  }
}
