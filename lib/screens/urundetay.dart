import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter1/screens/kutucukolustur.dart';
import 'package:intl/intl.dart';

import 'listscreen.dart';

var butonrengi = Color(0x791074DE);
var yazirengi = Color(0xF0FFFFFF);
var butonrengi2= Color(0xFF083663);
var butonrengi3= Color(0xFF487BEA);

class TarihScreen extends StatefulWidget {
  @override
  TarihScreen({required this.araeleman4, required this.value});
  List araeleman4;
  int value;
  // String value;

  _MyHomePageState createState() => _MyHomePageState(araeleman_list4: araeleman4, ind_val: value);
}

class _MyHomePageState extends State<TarihScreen> {
  bool _rememberMe = false;
  _MyHomePageState({required this.araeleman_list4, required this.ind_val});
  List araeleman_list4=['a'];
  int ind_val;
  DateTime selectedDate = DateTime.now();
  var formattedDate;


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        formattedDate = DateFormat('dd.MM.yyyy').format(selectedDate);
        araeleman_list4[ind_val].expirationDate=formattedDate;
      });
    }
  }



  Widget secondarystackBehindDismiss() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFFAA031D),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.delete, color: yazirengi),
            Text('', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget stackBehindDismiss() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF479BF1),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(Icons.favorite, color: yazirengi),
            Text('', style: TextStyle(color: Colors.white)),
          ],
        ),
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

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _buildSocialBtn(
                () => print('Login with Google'),
            AssetImage(
              'assets/logos/foto.jpg',
            ),
          ),
        ],
      ),
    );
  }

  void deleteItem(index) {
    setState(() {
      araeleman_list4.removeAt(index);
    });
  }

  void undoDeletion(index, item) {
    setState(() {
      araeleman_list4.insert(index, item);
    });
  }

  void addItem(index) {
    setState(() {
      // araeleman = List.from(urun_list[index]);
      araeleman_list4.add(araeleman_list4[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: butonrengi2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),),
        toolbarHeight: 80.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0), child: Text(
              'In My Home',
              style: TextStyle(
                color: yazirengi,
                fontFamily: 'OpenSans',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),),
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
              // Flex(
              //   direction: Axis.vertical,
              //   children: <Widget>[
              //     Flexible(flex: 1,
              //       child: ListView.builder(
              //         itemCount: araeleman_list4.length,
              //         itemBuilder: (context, index) {
              //           return Dismissible(
              //               background: stackBehindDismiss(),
              //               secondaryBackground: secondarystackBehindDismiss(),
              //               key: ObjectKey(araeleman_list4[index]),
              //               child: Container(
              //                 padding: EdgeInsets.all(5.0),
              //                 child: SignInButton(
              //                   text: araeleman_list4[index].productname,
              //                   text1: araeleman_list4[index].enterance,
              //                   text2: araeleman_list4[index].expirationDate,
              //                   onPressed: () {},
              //                 ),
              //               ),
              //               onDismissed: (direction) {
              //                 if (direction == DismissDirection.startToEnd) {
              //                   print("Add to favorite");
              //                   //add "add to favorite" function
              //                 } else {
              //                   print('Remove item');
              //                   addItem(index);
              //                   deleteItem(index);
              //                 }
              //               },
              //               confirmDismiss: (DismissDirection direction) async {
              //                 return await showDialog(
              //                   context: context,
              //                   builder: (BuildContext context) {
              //                     return AlertDialog(
              //                       title: const Text("Confirm"),
              //                       content: direction == DismissDirection.startToEnd
              //                           ? Text(
              //                           "Ürünü favorilere eklemek ister misiniz?")
              //                           : Text(
              //                           "Ürünü silmek istediğinizden emin misiniz??"),
              //                       actions: <Widget>[
              //                         FlatButton(
              //                           onPressed: () => Navigator.of(context).pop(true),
              //                           child: direction == DismissDirection.startToEnd
              //                               ? Text("FAVORITE")
              //                               : Text("DELETE"),
              //                         ),
              //                         FlatButton(
              //                           onPressed: () => Navigator.of(context).pop(false),
              //                           child: const Text("CANCEL"),
              //                         ),
              //                       ],
              //                     );
              //                   },
              //                 );
              //               });
              //
              //         },
              //       ),
              //
              //     )
              //   ],
              // ),
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
                      SignInButton(
                          text: 'Tarih Değiştir',
                          text1: '',
                          text2: "${selectedDate.toLocal()}".split(' ')[0],
                          onPressed: () => _selectDate(context)),
                      SizedBox(
                        height: 30.0,
                      ),
                      SignInButton(
                          text: 'Değiştir',
                          text1: '',
                          text2: '',
                          onPressed: () {var route = new MaterialPageRoute(
                            builder: (BuildContext context) =>
                            new ListScreen(value: araeleman_list4[0].expirationDate, urunlist: araeleman_list4, araeleman: [],),
                          );
                          Navigator.pushNamed(context, '/first');}),
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
