import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Center Container_Text(String title, Function callback) {
  return Center(
    child: InkWell(
      onTap: () => callback(),
      child: Card(
        elevation: 1,
        child: Container(
          height: 600,
          width: 400,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              title,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    ),
  );
}
