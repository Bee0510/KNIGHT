// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sos/Screens/SOS_Page.dart';
import '../Auth Models/auth_class.dart';
import 'auth_decider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);

    if (user == null) {
      return Auth_Decider();
    } else {
      return SOS_Page();
    }
  }
}
