import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter1/screens/constants.dart';

var butonrengi = Color(0xBE6296CE);

class ListScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ListScreen> {
  bool _rememberMe = false;

  Widget _buildaraTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black87,
              ),
              hintText: 'Arama',
              hintStyle: TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildheadTF() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Ev Bakım Button Pressed'),
        padding: EdgeInsets.all(15.0),
        color: Color(0x791074DE),
        child: Text(
          'Ürün Adı             Giriş Tarihi             Kalan Gün',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildurun1TF() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Ev Bakım Button Pressed'),
        padding: EdgeInsets.all(15.0),
        color: butonrengi,
        child: Text(
          'Domates           25.12.2021             6 Gün',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildurun2TF() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Ev Bakım Button Pressed'),
        padding: EdgeInsets.all(15.0),
        color: butonrengi,
        child: Text(
          'Dondurma             28.12.2021             39 Gün',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildurun3TF() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Ev Bakım Button Pressed'),
        padding: EdgeInsets.all(15.0),
        color: butonrengi,
        child: Text(
          'Portakal             25.12.2021             6 Gün',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildurun4TF() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Ev Bakım Button Pressed'),
        padding: EdgeInsets.all(15.0),
        color: butonrengi,
        child: Text(
          'Yumurta             28.12.2021             13 Gün',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildurun5TF() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Ev Bakım Button Pressed'),
        padding: EdgeInsets.all(15.0),
        color: butonrengi,
        child: Text(
          'Ekmek             29.12.2021             4 Gün',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildurun6TF() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Ev Bakım Button Pressed'),
        padding: EdgeInsets.all(15.0),
        color: butonrengi,
        child: Text(
          'Peynir             28.12.2021             14 Gün',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildurun7TF() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Ev Bakım Button Pressed'),
        padding: EdgeInsets.all(15.0),
        color: butonrengi,
        child: Text(
          'Sucuk             21.12.2021             8 Gün',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildurun8TF() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Ev Bakım Button Pressed'),
        padding: EdgeInsets.all(15.0),
        color: butonrengi,
        child: Text(
          'Tereyağ             23.12.2021             15 Gün',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildurun9TF() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Ev Bakım Button Pressed'),
        padding: EdgeInsets.all(15.0),
        color: butonrengi,
        child: Text(
          'Sosis             23.12.2021             9 Gün',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildurun10TF() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Ev Bakım Button Pressed'),
        padding: EdgeInsets.all(15.0),
        color: butonrengi,
        child: Text(
          'Çikolata             28.12.2021             29 Gün',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildurun11TF() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Ev Bakım Button Pressed'),
        padding: EdgeInsets.all(15.0),
        color: butonrengi,
        child: Text(
          'Bisküvi             28.12.2021             159 Gün',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildurun12TF() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Ev Bakım Button Pressed'),
        padding: EdgeInsets.all(15.0),
        color: butonrengi,
        child: Text(
          'Patates             25.12.2021             6 Gün',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildurun13TF() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Ev Bakım Button Pressed'),
        padding: EdgeInsets.all(15.0),
        color: butonrengi,
        child: Text(
          'Tavuk             27.12.2021             5 Gün',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildurun14TF() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Ev Bakım Button Pressed'),
        padding: EdgeInsets.all(15.0),
        color: butonrengi,
        child: Text(
          'Ayran             29.12.2021             15 Gün',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildurun15TF() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Ev Bakım Button Pressed'),
        padding: EdgeInsets.all(15.0),
        color: butonrengi,
        child: Text(
          'Süt             29.12.2021             7 Gün',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Colors.blueGrey,
                      Colors.black45,
                      Colors.grey,
                      Colors.black45,
                      Colors.blueGrey,
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
                    horizontal: 5.0,
                    vertical: 60.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Gıda',
                        style: TextStyle(
                          color: Colors.black87,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildaraTF(),
                      _buildheadTF(),
                      _buildurun1TF(),
                      _buildurun2TF(),
                      _buildurun3TF(),
                      _buildurun4TF(),
                      _buildurun5TF(),
                      _buildurun6TF(),
                      _buildurun7TF(),
                      _buildurun8TF(),
                      _buildurun9TF(),
                      _buildurun10TF(),
                      _buildurun11TF(),
                      _buildurun12TF(),
                      _buildurun13TF(),
                      _buildurun14TF(),
                      _buildurun15TF(),
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
