import 'package:firebase_database/firebase_database.dart';
import 'package:inmyhome/model_classes/user.dart';


final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference saveUser(User user){
  var id = databaseReference.child('users/').push();
  id.set({user.toJson()});
  return id;
}