import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class DBFunctions {


  static Future<List<String>> searchItem(FirebaseFirestore firebaseFirestore,String collection, String identifier,String text) async {
      late List<String> strList = List.empty();

     var document =  FirebaseFirestore.instance.collection(collection).where(identifier,isEqualTo: text).get()
         .then((snapshot) =>{
            for(int i = 0; i < snapshot.docs.first.data().entries.length;i++){
             strList.add(snapshot.docs.first.data().entries.elementAt(i).value)
             }
         });
      return strList;
  }

}