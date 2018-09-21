import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'dart:async';
import 'package:firebase_auth_world/model/Kwizn.dart';

abstract class BaseDatabase {
  Future<String> pushProfileToDatabase(
      String userID, String displyName, String email);
  // Future<StreamSubscription<Event>> getKwiznStream(
  //     String kwiznKey, void onData(Kwizn kwizn));
  // Future<Kwizn> getkwizn();
}

class Database implements BaseDatabase {
  final generalReference = FirebaseDatabase.instance;

  // post a user's profile data stored under users/userID, store the first name and email.
  // concider retruning void becayse we don't use any information it returns, nor does the firebase function return anything.
  Future<String> pushProfileToDatabase(
      String userID, String displyName, String email) async {
    generalReference
        .reference()
        .child('users/' + userID)
        .push()
        .set({'first_name': displyName, 'email': email});
    return displyName;
  }

  // Future<StreamSubscription<Event>> getKwiznStream(
  //     String kwiznKey, void Function(Kwizn kwizn) onData) async {
  //   // what is an account key?
  //   //String accountKey = await Preferences.getAccountKey();
  //   StreamSubscription<Event> subscription = generalReference
  //       .reference()
  //       .child('kwizn')
  //       // .child(accountKey)
  //       // .child('kwizn')
  //       .onValue
  //       .listen((Event event) {
  //     var kwizn = new Kwizn.fromJson(event.snapshot.key, event.snapshot.value);
  //     onData(kwizn);
  //   });

  //   return subscription;
  // }

  // Future<Kwizn> getkwizn() async {
  //   Completer<Kwizn> completer = new Completer<Kwizn>();

  //   //com up with a random account key
  //   //String accountKey = await Preferences.getAccountKey();

  //   FirebaseDatabase.instance
  //       .reference()
  //       .child('kwizn/check')
  //       // .child(accountKey)
  //       // .child('kwizn')
  //       //.child(kwiznKey)
  //       .once()
  //       .then((DataSnapshot snapshot) {
  //     var kwizn = new Kwizn.fromJson(snapshot.key, snapshot.value);
  //     completer.complete(kwizn);
  //   });
  //   //print("The data is: $value");
  //   return completer.future;
  // }
}
