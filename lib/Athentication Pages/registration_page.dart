// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, camel_case_types, avoid_unnecessary_container, unused_field, sized_box_for_whitespace, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../For Authentication/Auth.dart';
import '../Small widgets/texfield_formfill.dart';
import '../Widget/loader.dart';

class Registration_page extends StatefulWidget {
  final Function toggleChange;
  const Registration_page(this.toggleChange);

  @override
  State<Registration_page> createState() => _Registration_pageState();
}

class _Registration_pageState extends State<Registration_page> {
  final Authentication _authentication = Authentication();
  final _formkey = GlobalKey<FormState>();
  String Email = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loader()
        : Scaffold(
            backgroundColor: Color.fromRGBO(10, 4, 60, 100),
            body: Form(
                key: _formkey,
                child: Center(
                  child: Container(
                    width: 300,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            child: Lottie.network(
                                'https://assets6.lottiefiles.com/packages/lf20_cgjrfdzx.json'),
                          ),
                          TextFormField(
                            validator: (value) =>
                                value!.isEmpty ? 'Enter the email' : null,
                            keyboardType: TextInputType.emailAddress,
                            decoration: TextField_decor.copyWith(
                                hintText: 'Email',
                                icon: Icon(Icons.mail, color: Colors.white)),
                            onChanged: (value) {
                              setState(() {
                                Email = value;
                              });
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            validator: (value) => value!.length < 6
                                ? 'Enter a valid password'
                                : null,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: TextField_decor.copyWith(
                                hintText: 'Password',
                                icon: Icon(
                                  Icons.security,
                                  color: Colors.white,
                                )),
                            onChanged: (value) {
                              setState(() {
                                password = value;
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              OutlinedButton.icon(
                                onPressed: () async {
                                  if (_formkey.currentState!.validate()) {
                                    setState(() => loading = true);
                                    dynamic result = await _authentication
                                        .RegisterTHroughEmail(Email, password);
                                    if (result == null) {
                                      setState(() {
                                        loading = false;
                                        if (Email.contains('@gmail.com')) {
                                          error = 'Email already exists';
                                        } else
                                          (error = 'Invalid Email');
                                      });
                                    }
                                  }
                                },
                                icon: Icon(Icons.app_registration),
                                label: Text('Register'),
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        width: 2, color: Colors.white)),
                              ),
                              SizedBox(height: 8),
                              Divider(thickness: 2, color: Colors.grey[850]),
                              ElevatedButton.icon(
                                onPressed: () {
                                  widget.toggleChange();
                                },
                                icon: Icon(Icons.login),
                                label: Text('Login'),
                              )
                            ],
                          ),
                          SizedBox(height: 30),
                          Text(error, style: TextStyle(color: Colors.red))
                        ],
                      ),
                    ),
                  ),
                )),
          );
  }
}
