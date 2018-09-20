import 'package:flutter/material.dart';
import 'package:firebase_auth_world/firebase_helper/auth.dart';
import 'package:firebase_auth_world/firebase_helper/database.dart';
import 'package:firebase_auth_world/widgets/RestaurantCard.dart';

class HomePage extends StatefulWidget {
  HomePage({this.auth, this.onSignedOut, this.databse});
  final BaseAuth auth;
  final BaseDatabase databse;
  final VoidCallback onSignedOut;

    @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  Color gradientStart =Colors.deepPurple[700]; //Change start gradient color here
  Color gradientEnd = Colors.purple[500]; //Change end gradient color here

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
    void initState() {
      // TODO: implement initState
      super.initState();
    }
 
 @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // backgroundColor: Colors.grey,
      appBar: new AppBar(
        title: new Text("Kwizny"),
        backgroundColor: Colors.red,
        actions: <Widget>[
          new FlatButton(
              child: new Text("Logout",
                  style: new TextStyle(fontSize: 17.0, color: Colors.white)),
              onPressed: _signOut)
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Restaurantcard(
            headImmageAssetpath: 'assets/images/salad.jpg',
            title: "Surpise Salad",
            subtitle: 'Minneaplis, Mn',
            heartCoutn: 240,
          ),
          new Restaurantcard(
              headImmageAssetpath: 'assets/images/my.jpg',
              title: "Mochie",
              subtitle: 'Minneapolis, Mn',
              heartCoutn: 1392),
          new Restaurantcard(
              headImmageAssetpath: 'assets/images/test.jpg',
              title: "The dog",
              subtitle: 'Minneapolis, MN',
              heartCoutn: 350),
        ],
      ),
      //To add on click events, follow this stack overflow answer
      //https://stackoverflow.com/questions/50883918/bottom-navigation-bar-is-relaoding-all-the-widgets-each-time-i-press-a-navigatio
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.favorite), title: new Text('favorites')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: new Text('Profile'))
        ],
      ),
    );
  }


}




 

 



//
// class Kwizn {
//   final String key;
//   String name;

//   Kwizn.fromJson(this.key, Map data ){
//     name == data['name'];
//     if (name == null) {
//       name = '';
      
//     }
//   }
// }




