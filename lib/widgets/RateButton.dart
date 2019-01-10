import 'package:flutter/material.dart';

class RateButton extends StatelessWidget {
  final String text;
  final Icon icon;
  final double buttonWidth;

  RateButton({this.text, this.icon, this.buttonWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: EdgeInsets.symmetric(horizontal: 8),
        width: buttonWidth,
        child: OutlineButton(
          //textColor: Color(0xfffc4041),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text,
                style:
                    TextStyle(color: Color(0xfffc4041), fontFamily: 'sofiapro'),
              ),
              icon
            ],
          ),
          color: Color(0xfffc4041),
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(8.0)),
          onPressed: null,
          disabledBorderColor: Color(0xfffc4041),
        ));
  }

 // Widget rateButton() {}
}
