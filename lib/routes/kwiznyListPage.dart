import 'package:firebase_auth_world/model/Kwizn.dart';
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
            onTap: () => widget.onPush(materialIndex),
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