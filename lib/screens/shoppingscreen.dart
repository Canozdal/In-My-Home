import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter1/screens/constants.dart';
import 'kutucukolustur.dart';
import 'kutucukolustur2.dart';
import 'productekle.dart';
import 'package:flutter1/main.dart';
import 'package:flutter1/screens/listscreen.dart';

var butonrengi = Color(0x791074DE);
var yazirengi = Color(0xF0FFFFFF);
var butonrengi2= Color(0xFF083663);
var butonrengi3= Color(0xFF487BEA);




class ShoppingScreen extends StatefulWidget {
  ShoppingScreen({required this.shoppinglist,required this.araeleman});
  List shoppinglist;
  List araeleman;
  // @override
  _LoginScreenState createState() => _LoginScreenState(shopping_list: shoppinglist,araeleman_list: araeleman);

}

class _LoginScreenState extends State<ShoppingScreen> {
  bool _rememberMe = false;
  _LoginScreenState({required this.shopping_list,required this.araeleman_list});
  List shopping_list;
  List araeleman_list;
  int _itemCount = 1;

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
      araeleman_list.removeAt(index);
    });
  }

  void undoDeletion(index, item) {
    setState(() {
      araeleman_list.insert(index, item);
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
          '   Alışveriş Listesi',
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
                      itemCount: araeleman_list.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                            background: stackBehindDismiss(),
                            secondaryBackground: secondarystackBehindDismiss(),
                            key: ObjectKey(araeleman_list[index]),
                            child: Container(
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(15.0),
                                        primary: butonrengi2,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30.0),
                                        ),
                                        minimumSize: Size(250, 60),
                                      ),
                                      child: Text(araeleman_list[index].productname)),
                                  _itemCount!=0?
                                  new  IconButton(icon: new Icon(Icons.remove),onPressed: ()=>setState(()=>_itemCount--),):
                                  new Container(),
                                  new Text(_itemCount.toString()),
                                  new IconButton(icon: new Icon(Icons.add),onPressed: ()=>setState(()=>_itemCount++)),
                                  // new Center(child: if (_itemCount==0){deleteItem(index),})
                                  // if (_itemCount == 0)
                                  //   araeleman_list.removeAt(index),
                                    // if (araeleman_list.length==0)
                                    //   araeleman_list.add('a'),
                                ],
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
                    ),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}