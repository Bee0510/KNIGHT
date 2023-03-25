// ignore_for_file: unused_local_variable, non_constant_identifier_names, prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';

import 'registration_page.dart';
import 'signIN_page.dart';

class Auth_Decider extends StatefulWidget {
  const Auth_Decider({super.key});

  @override
  State<Auth_Decider> createState() => _Auth_DeciderState();
}

class _Auth_DeciderState extends State<Auth_Decider> {
  bool IsSigned = true;
  void togglepage() {
    setState(() {
      IsSigned = !IsSigned;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (IsSigned) {
      return SignIN_Page(togglepage);
    } else {
      return Registration_page(togglepage);
    }
  }
}
