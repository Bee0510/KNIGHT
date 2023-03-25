// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sos/Screens/About_Page.dart';
import 'package:sos/Screens/Contact_Page.dart';
import 'package:sos/Screens/Home_Page.dart';
import 'package:sos/Screens/Location_page.dart';

import '../For Authentication/Auth.dart';
import '../Small widgets/App_Bar.dart';

class Bottom_Navigator_Bar extends StatefulWidget {
  const Bottom_Navigator_Bar({super.key});

  @override
  State<Bottom_Navigator_Bar> createState() => _Bottom_Navigator_BarState();
}

class _Bottom_Navigator_BarState extends State<Bottom_Navigator_Bar> {
  List<Map<String, Object>> _tabList = [];
  @override
  void initState() {
    _tabList = [
      {'Page': Home_Page(), 'Title': "Home"},
      {'Page': Location_page(), 'Title': "Map"},
      {'Page': Contact_page(), 'Title': "Contact"},
      {'Page': About_Page(), 'Title': "About"}
    ];
    super.initState();
  }

  int selectPage = 0;
  void togglePage(int page) {
    setState(() {
      selectPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_Bar(context, _tabList[selectPage]['Title'].toString()),
      body: _tabList[selectPage]['Page'] as Widget,
      // bottomNavigationBar: BottomNavigationBar(
      //   iconSize: 40,
      //   selectedItemColor: Colors.red,
      //   currentIndex: selectPage,
      //   type: BottomNavigationBarType.shifting,
      //   onTap: togglePage,
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.home, color: Colors.grey), label: 'Home'),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.location_history,
      //           color: Colors.grey,
      //         ),
      //         label: 'Location'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.contacts, color: Colors.grey),
      //         label: 'Contract'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.person, color: Colors.grey), label: 'About'),
      //   ],
      // ),
      bottomNavigationBar: FancyBottomNavigation(
        inactiveIconColor: Colors.grey,
        activeIconColor: Colors.red,
        textColor: Colors.red,
        circleColor: Colors.transparent,
        tabs: [
          TabData(
            iconData: Icons.home,
            title: 'Home',
          ),
          TabData(
            iconData: Icons.location_history,
            title: 'Location',
          ),
          TabData(
            iconData: Icons.contacts,
            title: 'Contacts',
          ),
          TabData(
            iconData: Icons.people,
            title: 'About',
          ),
        ],
        onTabChangedListener: togglePage,
      ),
    );
  }
}
