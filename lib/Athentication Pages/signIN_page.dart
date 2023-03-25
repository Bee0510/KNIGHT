// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, camel_case_types, avoid_unnecessary_containers, use_build_context_synchronously, use_key_in_widget_constructors, avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../For Authentication/Auth.dart';
import '../Small widgets/texfield_formfill.dart';
import '../Widget/loader.dart';

class SignIN_Page extends StatefulWidget {
  final Function toggleChange;
  const SignIN_Page(this.toggleChange);

  @override
  State<SignIN_Page> createState() => _SignIN_PageState();
}

class _SignIN_PageState extends State<SignIN_Page> {
  final Authentication _authentication = Authentication();
  final _formkey = GlobalKey<FormState>();
  String email = '';
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
                                'https://assets6.lottiefiles.com/packages/lf20_fztotluf.json'),
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            validator: (value) =>
                                value!.isEmpty ? 'Enter the email' : null,
                            keyboardType: TextInputType.emailAddress,
                            decoration: TextField_decor.copyWith(
                                hintText: 'Email',
                                icon: Icon(Icons.mail, color: Colors.white)),
                            onChanged: (value) {
                              setState(() {
                                email = value;
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            validator: (value) => value!.length < 6
                                ? 'Enter a valid password'
                                : null,
                            keyboardType: TextInputType.emailAddress,
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
                              ElevatedButton.icon(
                                onPressed: () async {
                                  if (_formkey.currentState!.validate()) {
                                    setState(() => loading = true);
                                    dynamic result =
                                        await _authentication.LogInThroughEmail(
                                            email, password);

                                    if (result == null) {
                                      setState(() {
                                        loading = false;
                                        if (email.contains('@gmail.com')) {
                                          error = 'Invalid Credential';
                                        } else {
                                          error = 'Invalid Email';
                                        }
                                      });
                                    }
                                  }
                                },
                                icon: Icon(Icons.login),
                                label: Text('Login'),
                                style: OutlinedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromRGBO(10, 4, 60, 100),
                                    side: BorderSide(
                                        width: 2, color: Colors.white)),
                              ),
                              SizedBox(height: 8),
                              Divider(thickness: 2, color: Colors.grey[850]),
                              ElevatedButton.icon(
                                onPressed: () {
                                  widget.toggleChange();
                                },
                                icon: Icon(Icons.app_registration),
                                label: Text('Register'),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Text(
                            'OR',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 12),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            onPressed: () {
                              Navigator.of(context).pushNamed('MyPhonePage');
                            },
                            icon: Icon(Icons.phone),
                            label: Text('Login using OTP'),
                          ),
                          SizedBox(height: 12),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          );
  }
}
