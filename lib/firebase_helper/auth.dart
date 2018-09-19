import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:firebase_auth_world/firebase_helper/database.dart';



abstract class BaseAuth {
  Future <String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<String> currentuser();
  Future<String> updateProfileChangeRequest(String firstName);
  Future<void> signOut();
  
}

class Auth implements BaseAuth {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  

  Future<String> signInWithEmailAndPassword( String email, String password) async {
    FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

    return user.uid + user.displayName;
  }

  Future<String> createUserWithEmailAndPassword(String email, String password) async {
    FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    
    return user.uid;
  }

  Future<String> currentuser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.uid; 
  }

  Future<String> updateProfileChangeRequest(String firstName) async{
    FirebaseUser user = await _firebaseAuth.currentUser();
    if (user != null) {
       UserUpdateInfo userInfo =  new UserUpdateInfo();
    userInfo.displayName = firstName;
     _firebaseAuth.updateProfile(userInfo);
     await user.reload();
  

    return user.displayName;
      
    }
   

     return "user was null";
  } 

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

}
