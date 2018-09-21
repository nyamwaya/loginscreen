import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'dart:async';
import 'package:firebase_auth_world/model/Kwizn.dart';

/*
This class is the model for how we access the firebase realtime database. 
Eventually, we will separate all firebase database concerns into this class
for now we only have the push prof 
*/

abstract class BaseDatabase {
  Future<String> pushProfileToDatabase(String userID, String displyName, String email);
}

class Database implements BaseDatabase {
  
  final generalReference = FirebaseDatabase.instance;

  //Post a user's profile data to the realtime database user thier userId
  Future<String> pushProfileToDatabase(String userID, String displyName, String email) async {
    generalReference
        .reference()
        .child('users/' + userID)
        .push()
        .set({'first_name': displyName, 'email': email});
    return displyName;
  }

}
