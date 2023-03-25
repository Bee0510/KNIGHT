// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:sos/Map/Map_Screen.dart';

class Location_page extends StatelessWidget {
  const Location_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Map_Screen(),
    );
  }
}
