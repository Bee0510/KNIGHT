// ignore_for_file: prefer_const_constructors
// @dart=2.9

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sos/Athentication%20Pages/Login_Phone.dart';
import 'package:sos/Athentication%20Pages/OTP_Page.dart';
import 'package:sos/Athentication%20Pages/wrapper.dart';
import 'package:sos/Auth%20Models/auth_class.dart';
import 'package:sos/Contact%20Provider/Contract_provider.dart';
import 'package:sos/For%20Authentication/Auth.dart';
import 'package:sos/Map/Map_Provider.dart';
import 'package:sos/Map/Map_Screen.dart';
import 'package:sos/Screens/Contact_Page.dart';
import 'package:sos/Screens/Home_Page.dart';
import 'package:sos/Screens/Profile_Page.dart';
import 'package:sos/Tab_View/Bottom_Tab_Bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<Users>.value(
          initialData: null,
          value: Authentication().UserDetails,
        ),
        ChangeNotifierProvider(
          create: (context) => LocationProvider(),
          child: Map_Screen(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
        routes: {
          'Home_Page': (context) => Home_Page(),
          'Profile_Page': (context) => Profile_Page(),
          'Bottom_Navigator_Bar': (context) => Bottom_Navigator_Bar(),
          'MyPhonePage': (context) => MyPhonePage(),
          'OTP_Verify_Page': (context) => OTP_Verify_Page(),
        },
      ),
    );
  }
}
