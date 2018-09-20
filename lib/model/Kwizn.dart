import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class Kwizn {
  String key;
  String address;
  String city_state;
  String name;
  String picture_url;

  Kwizn (this.address, this.city_state, this.name, this.picture_url);

    Kwizn.fromJson(this.key, Map data ){
    name == data['name'];
    if (name == null) {
      name = '';
      
    }
  }

  // Kwizn.fromSnapshot(DataSnapshot snapshot) 
  //     : key = snapshot.key,
  //     address = snapshot.value['address'],
  //     city_state = snapshot.value['city_state'],
  //     name = snapshot.value['name'],
  //     picture_url = snapshot.value['picture_url'];

  toJson() {
    return {
      'address': address, 
      'city_state': city_state,
      'name': name,
      'picture_url': picture_url,
    };
  }
}