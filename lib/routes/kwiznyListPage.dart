import 'package:firebase_auth_world/model/Kwizn.dart';
import 'package:firebase_auth_world/routes/kwizn_detail_page.dart';
import 'package:firebase_auth_world/widgets/RestaurantCard.dart';
import 'package:flutter/material.dart';

class KwiznyListPage extends StatefulWidget {
  KwiznyListPage({this.data, this.onPush});
  final List<Kwizn> data;
  final ValueChanged<int> onPush;

  @override
  State<StatefulWidget> createState() => _KwiznyListPageState();
}

class _KwiznyListPageState extends State<KwiznyListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: new Text(
          "KWIZNY",
          style: TextStyle(
              fontWeight: FontWeight.w800,
              //color: Colors.black,
              fontFamily: 'Quicksand',
              fontSize: 20.0),
        ),
      ),
      // appBar: new AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      //   centerTitle: true,
      //   leading: new IconButton(
      //     icon: new Icon(Icons.menu),
      //   ),
      //   title: new Text(
      //     "KWIZNY",
      //     style: TextStyle(
      //       //  fontWeight: FontWeight.w800,
      //         color: Colors.black,
      //        // fontFamily: 'Quicksand',
      //         fontSize: 20.0),
      //   ),
      // ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return Center(
      child: ListView.builder(
        itemCount: widget.data == null ? 0 : widget.data.length,
        itemBuilder: (BuildContext context, int index) {
          int materialIndex = index;
          return new GestureDetector(
            //Alternative way to do onTap..idk which way is prefered so I will do the other one, If You run into navigation issues with the details page, try this one.
            // onTap: () => widget.onPush(materialIndex),
            onTap: () => Navigator.of(context).push(new PageRouteBuilder(
                  pageBuilder: (_, __, ___) => new KwiznDetailPage(
                        address: '${widget.data[index].address}',
                        cityState: '${widget.data[index].city_state}',
                        //rmaterialIndex: index,
                        pictureUrl: '${widget.data[index].picture_url}',
                        title: '${widget.data[index].id}',
                      ),
                )),
            child: new Restaurantcard(
              title: '${widget.data[index].id}',
              subtitle: '${widget.data[index].city_state}',
              headImmageAssetpath: '${widget.data[index].picture_url}',
              heartCoutn: 50,
            ),
          );
        },
      ),
    );
  }
}
