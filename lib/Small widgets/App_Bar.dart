// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sos/Widget/ModalBottomSheet.dart';

AppBar App_Bar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
        onPressed: () {},
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
      Hero(
        tag: 'Hero',
        child: CircleAvatar(
          radius: 27,
          backgroundColor: Colors.red,
          child: CircleAvatar(
            radius: 25,
            child: IconButton(
              icon: Icon(Icons.photo),
              onPressed: () => show_modal_bottom_sheet(context),
            ),
          ),
        ),
      )
    ],
  );
}
