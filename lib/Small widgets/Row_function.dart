import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Row mainpage_row() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Hello, Vishal',
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              'Complete your profile',
              style: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Define location',
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              'What is your location?',
              style: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Colors.red,
              ),
            ),
          )
        ],
      )
    ],
  );
}
