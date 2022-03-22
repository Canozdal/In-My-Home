import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/screens/ayarlarscreen.dart';
import 'package:flutter1/screens/evimscreen.dart';
import 'package:flutter1/screens/hesapscreen.dart';
import 'package:flutter1/screens/kay%C4%B1tscreen.dart';
import 'package:flutter1/screens/listscreen.dart';
import 'package:flutter1/screens/login_screen.dart';
import 'package:flutter1/screens/productekle.dart';
import 'package:flutter1/screens/profile.dart';
import 'package:flutter1/screens/shoppingscreen.dart';
import 'package:flutter1/screens/tarama.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseAuth auth = FirebaseAuth.instance;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  List product_list = product_calistir();
  List shopping_list2 = product_calistir();
  List araeleman2=[];


  runApp(MyApp(urun_list: product_list, shopping_list: shopping_list2,araeleman_list: araeleman2));

}

class MyApp extends StatelessWidget {
  MyApp({required this.urun_list,required this.shopping_list,required this.araeleman_list});
  List urun_list;
  List shopping_list;
  List araeleman_list;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      initialRoute: auth.currentUser == null ? '/kayıtolma' : '/login',
      routes: {
        '/first': (context) => EvimScreen(),
        '/ayarlar': (context) => AyarlarScreen(),
        '/oturum': (context) => HesapScreen(),
        '/login': (context) => LoginScreen(),
        '/kayıt': (context) => KayitScreen(),
        '/kayıtolma': (context) => HesapScreen(),
        '/list': (context) => ListScreen(urunlist: urun_list,araeleman: araeleman_list,),
        '/tarama': (context) => TaramaScreen(),
        '/profil' : (context) => ProfilePage(),
        '/shopping': (context) => ShoppingScreen(shoppinglist: shopping_list,araeleman: araeleman_list,),
      },
    );
  }
}