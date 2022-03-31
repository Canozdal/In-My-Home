import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:flutter1/screens/urundetay.dart';

var butonrengi = Color(0x791074DE);
var yazirengi = Color(0xF0FFFFFF);
var butonrengi2= Color(0xFF083663);
var butonrengi3= Color(0xFF487BEA);

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
      home: MyHomePage(),
      initialRoute: auth.currentUser == null ? '/kayıtolma' : '/homepage',
      routes: {
        '/homepage': (context) => MyHomePage(),
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
        '/urundetay': (context) => TarihScreen(araeleman4: araeleman_list, value: 0,)
      },
    );
  }
}



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () => Navigator.pushNamed(context, "/login"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: new Color(0xff622f74),
              gradient: LinearGradient(
                colors: [new Color(0xff6dd5ed), new Color(0xff2193b0)],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // CircleAvatar(
              //   backgroundColor: Colors.white,
              //   radius: 75.0,
              //   child: Icon(
              //     Icons.location_on,
              //     color: new Color(0xff2193b0),
              //     size: 50.0,
              //   ),
              // ),
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/logos/company.png',
                  width: 200.0,
                  height: 300.0,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       body: Center(
  //         child: ClipRRect(
  //           borderRadius:
  //           BorderRadius.circular(0),
  //           child: Image.asset(
  //             'assets/logos/company.png',
  //             width: 300.0,
  //             height: 400.0,
  //             fit: BoxFit.fill,
  //           ),
  //         ),
  //       )
  //   );
  // }
}
// class SecondScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title:Text("GeeksForGeeks")),
//       body: Center(
//           child:Text("Home page",textScaleFactor: 2,)
//       ),
//     );
//   }
// }