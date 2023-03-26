// ignore_for_file: prefer_const_literals_to_create_immutables, camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SOS_Page extends StatefulWidget {
  const SOS_Page({super.key});

  @override
  State<SOS_Page> createState() => _SOS_PageState();
}

class _SOS_PageState extends State<SOS_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 140),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed('Bottom_Navigator_Bar');
              },
              child: Center(
                child: Lottie.network(
                    'https://assets7.lottiefiles.com/packages/lf20_EOl7yZ.json'),
              ),
            ),
            SizedBox(height: 100),
            Text('Let me help you',
                style: GoogleFonts.montserrat(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 20,
                        color: Colors.black,
                      )
                    ])),
          ],
        ),
      ),
    );
  }
}
