import 'package:firebase_auth_world/model/Kwizn.dart';
import 'package:firebase_auth_world/widgets/RestaurantCard.dart';
import 'package:flutter/material.dart';

class ColorsListPage extends StatelessWidget {
  ColorsListPage({this.color, this.title, this.onPush, this.data});
  final MaterialColor color;
  final String title;
  final ValueChanged<int> onPush;
  List<Kwizn> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     title,
        //   ),
        //   backgroundColor: color,
        // ),
        body: Container(
          color: Colors.white,
          child: _buidlTheList(),
        ));
  }

  final List<int> materialIndices = [900, 800, 700, 600, 500, 400, 300, 200, 100, 50];

  Widget _buildList() {
    return ListView.builder(
        itemCount: materialIndices.length,
        itemBuilder: (BuildContext content, int index) {
          int materialIndex = materialIndices[index];
          return Container(
            color: color[materialIndex],
            child: ListTile(
              title: Text('$materialIndex', style: TextStyle(fontSize: 24.0)),
              trailing: Icon(Icons.chevron_right),
              onTap: () => onPush(materialIndex),
            ),
          );
        });
  }

  Widget _buidlTheList(){
    return Center(

          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return new Restaurantcard(
                // title: '${data[index].name}',
                // subtitle: '${data[index].city_state}',
                // headImmageAssetpath: '${data[index].picture_url}',
                title: 'Title',
                subtitle: 'City State',
                headImmageAssetpath: 'assets/images/my.jpg',
                heartCoutn: 50,
              );
            },
          ),

    );
  }
}
