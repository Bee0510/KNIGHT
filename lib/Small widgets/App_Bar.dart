// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../For Authentication/Auth.dart';

AppBar App_Bar(BuildContext context, String title) {
  Authentication _auth = Authentication();
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
        onPressed: () {
          print('object');
        },
        icon: Icon(
          Icons.menu,
          color: Colors.black,
          size: 40,
        )),
    title: Center(
      child: Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    ),
    actions: <Widget>[
      InkWell(
        onTap: () {
          _auth.LogOut();
        },
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.logout,
          ),
        ),
      )
    ],
  );
}
