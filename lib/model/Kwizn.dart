import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class Kwizn {
  String _id;
  String _address;
  String _city_state;
  String _name;
  String _picture_url;

  Kwizn (this._id, this._address, this._city_state, this._name, this._picture_url);

  Kwizn.map(dynamic obj){
    this._id = obj['id'];
    this._address = obj['address'];
    this._city_state = obj['city_state'];
    this._name = obj['name'];
    this._picture_url = obj['picture_url'];
  }

  String get id => _id;
  String get address => _address;
  String get city_state => _city_state;
  String get name => _name;
  String get picture_url => _picture_url;

  Kwizn.fromSnapshot(DataSnapshot snapshot){
    _id = snapshot.key;
    _address = snapshot.value['address'];
    _city_state = snapshot.value['city_state'];
    _name = snapshot.value['name'];
    _picture_url = snapshot.value['picture_url'];
  }
}