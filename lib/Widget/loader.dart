// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(10, 4, 60, 100),
      child: Center(
        child: SpinKitFadingCube(
          size: 60,
          color: Colors.white,
        ),
      ),
    );
  }
}
