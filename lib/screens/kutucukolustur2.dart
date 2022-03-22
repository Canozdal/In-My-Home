import 'package:flutter/material.dart';
import 'custom_raised_button.dart';
var yazirengi = Color(0xF0FFFFFF);
var butonrengi2= Color(0xFF083663);

class SignInButton2 extends CustomRaisedButton {
  SignInButton2({
    required String text,
    required VoidCallback onPressed,
  })
      : super(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // use whichever suits your need
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            color: yazirengi,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ],
    ),
    color: butonrengi2,
    onPressed: onPressed,
  );
}

