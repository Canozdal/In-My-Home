import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter1/model/user.dart';

class UserService extends ChangeNotifier {
  String? _name;
  String? _email;

  final String collectionName = 'Users';

  String get name => _name!;

  String get email => _email!;

  Future<void> createUser({required String name}) async {
    final docUser = FirebaseFirestore.instance.collection(collectionName).doc();

    final json = {
      'name': this.name,
      'email': email,
      'id': docUser.id,
    };

    await docUser.set(json);
  }

  //
  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection(collectionName)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

  Future<User?> readUser(String id) async {
    final docUser =
        FirebaseFirestore.instance.collection(collectionName).doc(id);
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      return User.fromJson(snapshot.data()!);
    }
  }
}
