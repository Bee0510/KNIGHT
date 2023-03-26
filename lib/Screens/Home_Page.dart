// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, avoid_unnecessary_containers, sized_box_for_whitespace, import_of_legacy_library_into_null_safe, sort_child_properties_last, unused_element, non_constant_identifier_names, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'package:sos/For%20Authentication/Auth.dart';

import 'package:url_launcher/url_launcher.dart';
import '../Small widgets/Container_Text.dart';
import '../Small widgets/Row_function.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  List<int> PhoneNumber = [
    102,
    101,
    1066,
    1091,
    101,
    1095,
    1291,
    1077,
    1066,
    1267,
    1099,
    197
  ];

  void getHelp(int index) async {
    await FlutterPhoneDirectCaller.callNumber('${PhoneNumber[index]}');
  }

  void ambulance() => getHelp(0);
  void Traffic() => getHelp(1);
  void hospital() => getHelp(2);
  void womwn() => getHelp(3);
  void police() => getHelp(4);
  void fire() => getHelp(5);
  void SeniorCitizen() => getHelp(6);
  void Disaster() => getHelp(7);
  void AntiPoison() => getHelp(8);
  void NDMC() => getHelp(9);
  void AccidentTrauma() => getHelp(10);
  void DirectoryEnquiry() => getHelp(11);

  @override
  Widget build(BuildContext context) {
    Authentication _auth = Authentication();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 25),
              Container(
                height: 70,
                width: 360,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.circular(10)),
                child: mainpage_row(),
              ),
              SizedBox(height: 25),
              Container(
                width: 360,
                child: Center(
                  child: Text(
                    'Emergency Help ',
                    style: GoogleFonts.montserrat(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                width: 360,
                child: Center(
                  child: Text(
                    'Needed ',
                    style: GoogleFonts.montserrat(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                width: 360,
                child: Center(
                  child: Text(
                    'Just hold the button to call',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              InkWell(
                borderRadius: BorderRadius.circular(200),
                onLongPress: () async {
                  launch('tel:+918319083735');
                },
                onDoubleTap: () async {
                  await launch('sms:+918319083735');
                },
                child: Lottie.network(
                  'https://assets8.lottiefiles.com/packages/lf20_rops2a21.json',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: GridView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Container_Text('Ambulance', ambulance),
                    Container_Text('Traffic Emergency', Traffic),
                    Container_Text('Hospital', hospital),
                    Container_Text('Women Safety', womwn),
                    Container_Text('Police Helpline', police),
                    Container_Text('Fire Station', fire),
                    Container_Text('Senior Citizen Helpline', SeniorCitizen),
                    Container_Text('Disaster Management', Disaster),
                    Container_Text('Anti-Poison', AntiPoison),
                    Container_Text('NDMC Control Room', NDMC),
                    Container_Text(
                        'Accident & Trauma Services', AccidentTrauma),
                    Container_Text('Directory Enquiry', DirectoryEnquiry),
                  ],
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,
                    childAspectRatio: 1,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
