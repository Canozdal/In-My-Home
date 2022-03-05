import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter1/screens/constants.dart';
import 'package:flutter1/service/user_services.dart';
import 'package:flutter1/service/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
var butonrengi = const Color(0x791074DE);

class KayitScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<KayitScreen> {
  bool _rememberMe = false;
  final _registerFormKey = GlobalKey<FormState>();

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  /**
   * Email Label
   */
  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(color: Colors.black87),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _emailTextController,
            focusNode: _focusEmail,
            validator: (value) => Validator.validateEmail(email: value!),
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.black87,
              ),
              hintText: 'Email veya kullanıcı adı giriniz',
              hintStyle: TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /**
   * Name Label
   */
  Widget _buildIsimTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Ad',
          style: TextStyle(color: Colors.black87),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _nameTextController,
            focusNode: _focusName,
            validator: (value) => Validator.validateName(name: value!),
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.account_circle,
                color: Colors.black87,
              ),
              hintText: 'Adınızı giriniz',
              hintStyle: TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /**
   * Last Name Label
   */
  Widget _buildSoyisimTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Soyad',
          style: TextStyle(color: Colors.black87),
        ),
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
                Icons.account_circle,
                color: Colors.black87,
              ),
              hintText: 'Soyadınızı giriniz',
              hintStyle: TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /**
   * Phone Number Label
   */
  Widget _buildTelefonTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Telefon',
          style: TextStyle(color: Colors.black87),
        ),
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
                Icons.local_phone,
                color: Colors.black87,
              ),
              hintText: 'Telefon numaranızı giriniz',
              hintStyle: TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /**
   * Confirm Password Label
   */
  Widget _buildSifreTekrarTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Şifre Tekrar',
          style: TextStyle(color: Colors.black87),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: const TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black87,
              ),
              hintText: 'Şifrenizi tekrar giriniz',
              hintStyle: TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /**
   * Password Label
   */
  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Şifre',
          style: TextStyle(color: Colors.black87),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _passwordTextController,
            focusNode: _focusPassword,
            validator: (value) => Validator.validatePassword(password: value!),
            obscureText: true,
            style: const TextStyle(
              color: Colors.black87,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black87,
              ),
              hintText: 'Şifrenizi giriniz',
              hintStyle: TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /**
   * Login Button
   */
  Widget _buildLoginBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async{
          if(_registerFormKey.currentState!.validate()) {
            User? user = await UserService.registerUsingEmailPassword(
                name: _nameTextController.text,
                email: _emailTextController.text,
                password: _passwordTextController.text);
          if(user != null) {
            Navigator.pushNamed(context, '/kayıtolma');
          }
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: butonrengi,
        child: const Text(
          'Kayıt Ol',
          style: TextStyle(
            color: Colors.black87,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  /**
   * Main Widget
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('In My Home'),),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: _registerFormKey,
            child:
            Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
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
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 60.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'In My Home',
                          style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        _buildIsimTF(),
                        const SizedBox(height: 10.0),
                        _buildSoyisimTF(),
                        const SizedBox(height: 10.0),
                        _buildEmailTF(),
                        const SizedBox(height: 10.0),
                        _buildTelefonTF(),
                        const SizedBox(height: 10.0),
                        _buildPasswordTF(),
                        const SizedBox(height: 10.0),
                        _buildSifreTekrarTF(),
                        const SizedBox(height: 10.0),
                        _buildLoginBtn(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),

        ),
      ),
    );
  }
}
