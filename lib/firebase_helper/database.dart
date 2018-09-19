import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'dart:async';

abstract class BaseDatabase{
  Future<String> pushProfileToDatabase(String userID, String displyName, String email);

}

class Database implements BaseDatabase {


  final generalReference = FirebaseDatabase.instance;

  

    Future<String> pushProfileToDatabase(String userID, String displyName, String email ) async{
      generalReference.reference().child('users/' +userID).push().set({
        'first_name': displyName,
        'email': email
      //'first_name':
      //'last_name'
      });
       return displyName;
  }

}