import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class UserService extends ChangeNotifier {


  /**
   * Firebase Authentication Registration
   * @param : email <String>, password <String>
   * @return : null
   * !!! : Pop up error messages will be implemented!
   */
  static Future<void> register(String email, String password) async{
      try{
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password);
      } on FirebaseAuthException catch (e) {
        if(e.code == 'weak-password'){
          print('The password provided is too weak.');
        }
        if(e.code == 'email-already-in-use'){
          print('The account already exists for that email.');
        }
      } catch (e){
        print(e);
      }
  }

  /**
   * Firebase Authentication Sign In
   * @param : email <String>, password <String>
   * @return : null
   * !!! : Pop up error messages will be implemented!
   */
  static Future<void> signIn(String email, String password) async{
    try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password);
    } on FirebaseAuthException catch (e){
      if(e.code == 'user-not-found'){

      } else if(e.code == 'wrong-password'){
        print('Wrong password provided for that user');
      }
    }
  }

/**
 * Firebase Email Verification
 * @param : null
 * @return : null
 * !!! : Will be implemented later
 */
  static Future<void> verifyEmail() async{
    User? user = FirebaseAuth.instance.currentUser;

    if(user != null && !user.emailVerified){
      await user.sendEmailVerification();
    }
  }

}
