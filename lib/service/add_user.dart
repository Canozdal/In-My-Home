

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddUser{

  final String fullName;
  final String email;

  AddUser(this.fullName,this.email);

  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  Future<void> addUser(){

    return users.add({
      'full name' : fullName,
      'email' : email,
    }).then ((value) => print('User added.'))
    .catchError((error) => print('Failed to Add User: $error'));
  }
  void printDetails(){
    print('Name : ${this.fullName}, Email : ${this.email}');
  }
}