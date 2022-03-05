import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


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

 /* //
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
  }*/

  /**
   * Method for registering users with email and password
   * @param : name (String), email (String), password (String),
   */
  static Future<User?> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try{
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password);
      user = userCredential.user;

      await user!.updateProfile(displayName: name);
      await user.reload();

      user = auth.currentUser;
    } on FirebaseAuthException catch(e){
      if(e.code == 'weak-password'){
        print('The password provided is too weak');
      } else if( e.code == 'email-already-in-use'){
        print(' The account already exists for that email');
      }
    } catch (e){
      print(e);
    }

    return user;
  }


  static Future<User?> signInUsingEmailPassword(
    {
      required String email,
      required String password,
      required BuildContext context,
  })
  async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);

      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if( e.code == 'user-not-found'){
        print(' No user found for that email');
      } else if (e.code == 'wrong-password'){
        print('Wrong Password');
      }
    }
    return user;
  }
  static Future<User?> refreshUser (User user) async{
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refreshedUser = auth.currentUser;

    return refreshedUser;
  }
}
