import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tarama.dart';

// final _firestore = FirebaseFirestore.instance;
// CollectionReference moviesRef = _firestore.collection('Products');
// var babaRef = moviesRef.doc('123456789');


// async(DocumentSnapshot<Object?> documentSnapshot) async {
//   List users_product = [];
//   var response= await babaRef.get();
//   var map = response;
//   var product14 = Product(productname: map['name'],shelfLife: map['shelflife']);
//   users_product = product14.listupdater(users_product) ;
//   print(map['name']);
// }
// class Movie {
//   Movie({required this.title, required this.genre});
//
//   Movie.fromJson(Map<String, Object?> json)
//       : this(
//     title: json['title']! as String,
//     genre: json['genre']! as String,
//   );
//
//   final String title;
//   final String genre;
//
//   Map<String, Object?> toJson() {
//     return {
//       'title': title,
//       'genre': genre,
//     };
//   }
// }
// final moviesRef = FirebaseFirestore.instance.collection('movies').withConverter<Movie>(
//   fromFirestore: (snapshot, _) => Movie.fromJson(snapshot.data()!),
//   toFirestore: (movie, _) => movie.toJson(),
// );
//
// Future<void> main() async {
//   // Obtain science-fiction movies
//   List<QueryDocumentSnapshot<Movie>> movies = await moviesRef
//       .where('genre', isEqualTo: 'Sci-fi')
//       .get()
//       .then((snapshot) => snapshot.docs);
//
//   // Add a movie
//   await moviesRef.add(
//     Movie(
//         title: 'Star Wars: A New Hope (Episode IV)',
//         genre: 'Sci-fi'
//     ),
//   );
//
//   // Get a movie with the id 42
//   Movie movie42 = await moviesRef.doc('42').get().then((snapshot) => snapshot.data()!);
// }

// getDriversList(String s) async {
//   var darak = await FirebaseFirestore.instance.collection('Products').doc(s);
//   return darak.get();
// }



Future<List> getUserMemories() async {
  List users_product = [];
  final _firestore = FirebaseFirestore.instance;
  // CollectionReference moviesRef = _firestore.collection('Products');
  // var babaRef = moviesRef.doc('123456789');
  CollectionReference memories = _firestore.collection('Products');
  List _memories = [
    {'title': 'myTitle'}
  ];
  try {
    final result = await memories
        .get();
    _memories = result.docs.map((e) => e.data()).toList();
    print("In FirestoreService: $_memories");
    print(_memories.length);
    print(_memories[0]['barcode']);
  } catch (e) {
    print("Failed to obtain user's memories: $e");
}
  users_product = _memories;
  return users_product;
}

// Future<List> getUserMemories() async {
//   final _firestore = FirebaseFirestore.instance;
//   CollectionReference memories = _firestore.collection('Products');
//   List _memories = [
//     {'title': 'myTitle'}
//   ];
//   try {
//     final result = await memories
//         .get();
//     _memories = result.docs.map((e) => e.data()).toList();
//     print("In FirestoreService: $_memories");
//   } catch (e) {
//     print("Failed to obtain user's memories: $e");
//   }
//   return _memories;
// }

// print(memories);

// List product_calistir() {
//   List users_product = [];
//   // var response= await babaRef.get();
//   var product1 = Product(productname: "süt",shelfLife: 10);
//   // var product14 = Product(productname: map['name'],shelfLife: map['shelflife']);
//   var product2 = Product(productname: "armut", shelfLife: 4);
//   var product3 = Product(productname: "muz", shelfLife: 7);
//   var product4 = Product(productname: "elma",shelfLife: 9);
//   var product5 = Product(productname: "kavun",shelfLife: 5);
//   var product6 = Product(productname: "karpuz",shelfLife: 5);
//   var product7 = Product(productname: "tavuk",shelfLife: 5);
//   var product8 = Product(productname: "et",shelfLife: 5);
//   var product9 = Product(productname: "sarı kola",shelfLife: 5);
//   var product10 = Product(productname: "siyah kola",shelfLife: 5);
//   var product11 = Product(productname: "oralet",shelfLife: 5);
//   var product12 = Product(productname: "kivi",shelfLife: 5);
//   var product13 = Product(productname: "karadut",shelfLife: 5);
//   users_product = product1.listupdater(users_product) ;
//   users_product = product2.listupdater(users_product) ;
//   users_product = product3.listupdater(users_product) ;
//   users_product = product4.listupdater(users_product) ;
//   users_product = product5.listupdater(users_product) ;
//   users_product = product6.listupdater(users_product) ;
//   users_product = product7.listupdater(users_product) ;
//   users_product = product8.listupdater(users_product) ;
//   users_product = product9.listupdater(users_product) ;
//   users_product = product10.listupdater(users_product) ;
//   users_product = product11.listupdater(users_product) ;
//   users_product = product12.listupdater(users_product) ;
//   users_product = product13.listupdater(users_product) ;
//   // users_product = product14.listupdater(users_product) ;
//   // product2.listremover(users_product);
//   // users_product = product2.listupdater(users_product) ;
//   return users_product;
// }


class Product{
  Product({this.productname="",this.shelfLife=0});
  String productname;
  int shelfLife;
  int id = 0;
  DateTime _exp = DateTime.now();
  String expirationDate ="a";
  String enterance="a";


  List listupdater(List updatedList){
    enterance = "${_exp.day}.${_exp.month}.${_exp.year}";
    this.id = 1;
    int check = 0;
    if (updatedList.length > 0) {
      while (check == 0){
        check = 1;
        for (int i = 0; i < updatedList.length; i = i+1 ){
          if (updatedList[i].productname == this.productname){
            if (updatedList[i].id == this.id){
              this.id ++;
              check = 0;
            }
          }
        }
      }
    }
    this._exp = _exp.add(Duration(days: this.shelfLife, hours: 0, minutes: 0));
    expirationDate = "${_exp.day}.${_exp.month}.${_exp.year}";
    updatedList.add(this);
    return updatedList;
  }
  void listremover(List updatedList){
    updatedList.remove(this);

  }
}