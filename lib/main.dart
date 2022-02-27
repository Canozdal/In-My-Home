import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inmyhome/screens/ayarlarscreen.dart';
import 'package:inmyhome/screens/evimscreen.dart';
import 'package:inmyhome/screens/hesapscreen.dart';
import 'package:inmyhome/screens/kay%C4%B1tscreen.dart';
import 'package:inmyhome/screens/listscreen.dart';
import 'package:inmyhome/screens/login_screen.dart';
import 'package:inmyhome/screens/tarama.dart';

FirebaseAuth auth = FirebaseAuth.instance;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      initialRoute: '/',
      routes: {
        '/first': (context) => EvimScreen(),
        '/ayarlar': (context) => AyarlarScreen(),
        '/oturum': (context) => HesapScreen(),
        '/login': (context) => LoginScreen(),
        '/kayıt': (context) => KayitScreen(),
        '/kayıtolma': (context) => HesapScreen(),
        '/list': (context) => ListScreen(),
        '/tarama': (context) => TaramaScreen(),
      },
    );
  }
}
