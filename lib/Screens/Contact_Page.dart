// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, avoid_types_as_parameter_names, sized_box_for_whitespace, non_constant_identifier_names, sort_child_properties_last

import 'dart:math';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sos/Widget/loader.dart';

class Contact_page extends StatefulWidget {
  const Contact_page({super.key});

  @override
  State<Contact_page> createState() => _Contact_pageState();
}

class _Contact_pageState extends State<Contact_page> {
  bool IsLoading = true;

  List<Contact> Contacts = [];
  void PermissionContacts() async {
    if (await Permission.contacts.isGranted) {
      getContact();
    } else {
      await Permission.contacts.request();
    }
  }

  void getContact() async {
    Contacts = await ContactsService.getContacts();

    setState(() {
      IsLoading = false;
    });
  }

  @override
  void initState() {
    PermissionContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IsLoading
        ? Loader()
        : Scaffold(
            body: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: Contacts.length,
                itemBuilder: (context, int) {
                  return ListTile(
                    horizontalTitleGap: 30,
                    leading: Container(
                      height: 30,
                      width: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 7,
                            color: Colors.white.withOpacity(0.1),
                            offset: const Offset(-3, -3),
                          ),
                          BoxShadow(
                            blurRadius: 7,
                            color: Colors.black.withOpacity(0.7),
                            offset: const Offset(3, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xff262626),
                      ),
                      child: Text(
                        Contacts[int].displayName![0],
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.primaries[
                              Random().nextInt(Colors.primaries.length)],
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    title: Text(
                      Contacts[int].displayName!,
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(Contacts[int].phones![0].value!),
                    trailing: IconButton(
                        onPressed: () async {
                          await FlutterPhoneDirectCaller.callNumber(
                              Contacts[int].phones![0].value!);
                        },
                        icon: Icon(
                          Icons.call,
                          color: Colors.red,
                        )),
                  );
                }));
  }
}
