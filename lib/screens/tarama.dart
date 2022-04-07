import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter1/flutter_barcode_scanner.dart';
import 'package:flutter1/screens/constants.dart';
import 'package:flutter1/screens/kutucukolustur.dart';

import 'listscreen.dart';

//import 'flutter_barcode_scanner.dart';
//import 'package:flutter_login_ui/screens/flutter_barcode_scanner.dart';

var butonrengi = Color(0x791074DE);
var yazirengi = Color(0xF0FFFFFF);
var butonrengi2 = Color(0xFF083663);
var butonrengi3 = Color(0xFF487BEA);

class TaramaScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TaramaScreen> {
  bool _rememberMe = false;
  String _scanBarcode = 'Unknown';
  List users_product = [];
  List users_product2 = [];

  @override
  void initState() {
    super.initState();
  }

  Future<void> startBarcodeScanStream() async {
    var scan = [];
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
        '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    var scan = [];
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
      //getUserMemories(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    scan.add(barcodeScanRes);
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    print('tarama çalıştı');
    var scan = [];
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      getUserMemories(barcodeScanRes);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    scan.add(barcodeScanRes);

    setState(() {
      _scanBarcode = scan[0] as String;
    });
  }

  Future<List> getUserMemories(String barcode) async {
    final _firestore = FirebaseFirestore.instance;
    print('memories çalıştı');
    // CollectionReference moviesRef = _firestore.collection('Products');
    // var babaRef = moviesRef.doc('123456789');
    CollectionReference memories = _firestore.collection('Products');
    List _memories = [
      {'title': 'myTitle'}
    ];
    try {
      final result = await memories.get();
      _memories = result.docs.map((e) => e.data()).toList();
      print("In FirestoreService: $_memories");
      print(_memories.length);
      print(_memories[0]['barcode']);
      for (var i = 0; i < _memories.length; i++) {
        if (_memories[i]['barcode'] == barcode) {
          print(_memories[i]['name']);
          isimtut=_memories[i]['name'];
          print(_memories[i]['barcode']);
          var product1 = Product(
              productname: _memories[i]['name'],
              shelfLife: int.parse(_memories[i]['shelflife']));
          setState(() {
            userProducts.add(product1);
            users_product = product1.listupdater(users_product);
          });
        }
      }
    } catch (e) {
      print("Failed to obtain user's memories: $e");
    }
    //users_product = _memories;
    return users_product;
  }

  Widget _buildBarcodeBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => scanBarcodeNormal(),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: butonrengi2,
        child: Text(
          'Barkod Tarat',
          style: TextStyle(
            color: yazirengi,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildUrunEkleBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => scanBarcodeNormal(),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: butonrengi2,
        child: Text(
          'Barcode',
          style: TextStyle(
            color: yazirengi,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildQrBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => scanQR(),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: butonrengi2,
        child: Text(
          'Qr',
          style: TextStyle(
            color: yazirengi,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildStreamBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => startBarcodeScanStream(),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: butonrengi2,
        child: Text(
          'Stream',
          style: TextStyle(
            color: yazirengi,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _buildSocialBtn(
                () => print('Login with Google'),
            AssetImage(
              'assets/logos/google.jpg',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      //onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: butonrengi2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
        toolbarHeight: 80.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'In My Home',
                style: TextStyle(
                  color: yazirengi,
                  fontFamily: 'OpenSans',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Image.asset(
                'assets/logos/company.png',
                width: 60.0,
                height: 60.0,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white10,
                      Colors.white10,
                      Colors.white10,
                      Colors.white10,
                      Colors.white10,
                    ],
                    stops: [0.1, 0.3, 0.5, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _buildBarcodeBtn(),
                      // _buildQrBtn(),
                      // _buildStreamBtn(),
                      // SignInButton(
                      //   text: 'Gönder',
                      //   text1: '',
                      //   text2: '',
                      //   onPressed: () {
                      //     var route = new MaterialPageRoute(
                      //       builder: (BuildContext context) => new ListScreen(
                      //         urunlist: userProducts,
                      //         araeleman: [],
                      //       ),
                      //     );
                      //     Navigator.of(context).push(route);
                      //   },
                      // ),
                      // Text('Scan result : $_scanBarcode\n',
                      //     style: TextStyle(fontSize: 20)),
                      SignInButton(text: 'Eklenen Ürün', text1: '=>', text2: isimtut, onPressed: (){}),
                      // Text(isimtut,
                      //     style: TextStyle(fontSize: 20))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Product {
  Product({this.productname = "", this.shelfLife = 0});
  String productname;
  int shelfLife;
  int id = 0;
  int count =1;
  DateTime _exp = DateTime.now();
  String expirationDate = "a";
  String enterance = "a";

  List listupdater(List updatedList) {
    enterance = "${_exp.day}.${_exp.month}.${_exp.year}";
    this.id = 1;
    int check = 0;
    // if (updatedList.length > 0) {
    //   while (check == 0) {
    //     check = 1;
    //     for (int i = 0; i < updatedList.length; i++) {
    //       if (updatedList[i]['name'] == this.productname) {
    //         /*if (updatedList[i].id == this.id){
    //           this.id ++;
    //           check = 0;
    //         }*/
    //       }
    //     }
    //   }
    // }
    this._exp = _exp.add(Duration(days: this.shelfLife, hours: 0, minutes: 0));
    expirationDate = "${_exp.day}.${_exp.month}.${_exp.year}";
    updatedList.add(this);
    return updatedList;
  }

  void listremover(List updatedList) {
    updatedList.remove(this);
  }
}
