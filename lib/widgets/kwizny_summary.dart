import 'package:firebase_auth_world/routes/kwizn_detail_page.dart';
import 'package:firebase_auth_world/style.dart';
import 'package:firebase_auth_world/widgets/separator.dart';
import 'package:flutter/material.dart';

class KwiznySummary extends StatelessWidget{
  KwiznySummary(this.title,  this.address, this.cityState, this.pictureUrl, {this.horizontal = true});
  KwiznySummary.vertical(this.title, this.address, this.cityState, this.pictureUrl ): horizontal = false;
   
  
  final String title;
  final String address;
  final String cityState;
  final String pictureUrl;
  
  final bool horizontal;

  @override
  Widget build(BuildContext context) {



    Widget _planetValue({String value, String image}) {
      return new Container(
        child: new Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Image.asset(image, height: 12.0),
            new Container(width: 8.0),
            new Text(value, style: Style.smallTextStyle),
          ]
        ),
      );
    }


    final planetCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(title, style: Style.titleTextStyle),
          new Container(height: 10.0),
          new Text(cityState, style: Style.commonTextStyle),
          new Separator(),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                flex: horizontal ? 1 : 0,
                child: _planetValue(
                  value: '5mins',
                  image: 'assets/img/ic_distance.png')

              ),
              new Container(
                width: horizontal ? 8.0 : 32.0,
              ),
              new Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _planetValue(
                  value: '20 coments',
                  image: 'assets/img/ic_gravity.png')
              )
            ],
          ),
        ],
      ),
    );


    final planetCard = new Container(
      child: planetCardContent,
      height: horizontal ? 124.0 : 154.0,
      margin: horizontal
        ? new EdgeInsets.only(left: 46.0)
        : new EdgeInsets.only(top: 72.0),
      decoration: new BoxDecoration(
        color: new Color(0xFF333366),
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
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                new FadeTransition(opacity: animation, child: child),
              ) ,
            )
          : null,
      child: new Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: <Widget>[
            planetCard,
            //planetThumbnail,
          ],
        ),
      )
    );
  }

}