import 'package:firebase_database/firebase_database.dart';

class User{
  String name;
  DatabaseReference _id;
  User(this.name,this._id);


  void setID( DatabaseReference id){
      this._id = id;
  }

  Map<String,dynamic> toJson(){
    return { 'name' : this.name , 'id' : this._id};
  }
}