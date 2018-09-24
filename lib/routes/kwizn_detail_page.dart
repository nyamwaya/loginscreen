import 'package:flutter/material.dart';

class KwiznDetailpage extends StatelessWidget {
  KwiznDetailpage({
    this.title,
    this.address,
    this.cityState,
    this.pictureUrl,
    this.color,
    /* Enable this if you choes to perform on tap the other way [See coment in kwiznyListPage] this.materialIndex: 500 */
  });
  final String title;
  final String address;
  final String cityState;
  final String pictureUrl;
  final MaterialColor color;
   /* Enable this if you choes to perform on tap the other way final int materialIndex; */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          title,
        ),
      ),
      body: Container(
        /* Enable this if you choes to perform on tap the other way [See coment in kwiznyListPage] color: color[materialIndex], */
       
      ),
    );
  }
}
