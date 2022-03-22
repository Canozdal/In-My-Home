import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter1/screens/constants.dart';
import 'kutucukolustur.dart';
import 'productekle.dart';
import 'package:flutter1/main.dart';

var butonrengi = Color(0x791074DE);
var yazirengi = Color(0xF0FFFFFF);
var butonrengi2= Color(0xFF083663);
var butonrengi3= Color(0xFF487BEA);

const List deneme = [];


class ListScreen extends StatefulWidget {
  ListScreen({required this.urunlist});
  List urunlist;
  // @override
  _LoginScreenState createState() => _LoginScreenState(urun_list: urunlist);

}

class _LoginScreenState extends State<ListScreen> {
  bool _rememberMe = false;
  _LoginScreenState({required this.urun_list});
  List urun_list;
  // get urunlist => urunlist;
  // get urunlist => Future.value(urunlist);

  Widget _buildaraTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          width: 380,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: yazirengi,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.search,
                color: yazirengi,
              ),
              hintText: 'Arama',
              hintStyle: TextStyle(
                color: yazirengi,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget secondarystackBehindDismiss() {
    return Container(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.delete, color: Colors.white),
            Text('Move to trash', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget stackBehindDismiss() {
    return Container(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(Icons.favorite, color: Colors.white),
            Text('Move to favorites', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _buildheadTF() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: 380,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        elevation: 5.0,
        onPressed: () => print('Ev Bakım Button Pressed'),
        padding: EdgeInsets.all(15.0),
        color: butonrengi2,
        child: Text(
          'Ürün             Giriş             Son Kullanma',
          style: TextStyle(
            color: yazirengi,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  void deleteItem(index) {
    setState(() {
      urun_list.removeAt(index);
    });
  }

  void undoDeletion(index, item) {
    setState(() {
      urun_list.insert(index, item);
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
        title: Text(
          '             Gıda',
          style: TextStyle(
            color: yazirengi,
            fontFamily: 'OpenSans',
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
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
              Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  _buildaraTF(),
                  _buildheadTF(),
                  Flexible(flex: 1,
                      child: ListView.builder(
                        itemCount: urun_list.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                              background: stackBehindDismiss(),
                              secondaryBackground: secondarystackBehindDismiss(),
                              key: ObjectKey(urun_list[index]),
                              child: Container(
                                padding: EdgeInsets.all(5.0),
                                child: SignInButton(
                                  text: urun_list[index].productname,
                                  text1: urun_list[index].enterance,
                                  text2: urun_list[index].expirationDate,
                                  onPressed: () {},
                                ),
                              ),
                              onDismissed: (direction) {
                                if (direction == DismissDirection.startToEnd) {
                                  print("Add to favorite");
                                  //add "add to favorite" function
                                } else {
                                  print('Remove item');
                                  deleteItem(index);
                                }
                              },
                              confirmDismiss: (DismissDirection direction) async {
                                return await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Confirm"),
                                      content: direction == DismissDirection.startToEnd
                                          ? Text(
                                          "Are you sure you wish add to favorite this item?")
                                          : Text(
                                          "Are you sure you wish to delete this item?"),
                                      actions: <Widget>[
                                        FlatButton(
                                          onPressed: () => Navigator.of(context).pop(true),
                                          child: direction == DismissDirection.startToEnd
                                              ? Text("FAVORITE")
                                              : Text("DELETE"),
                                        ),
                                        FlatButton(
                                          onPressed: () => Navigator.of(context).pop(false),
                                          child: const Text("CANCEL"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              });
                        },
                      ),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}