// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

class Contact_Provider with ChangeNotifier {
  List<Contact> contacts = [];
  void PermissionContacts() async {
    if (await Permission.contacts.isGranted) {
      getContact();
    } else {
      await Permission.contacts.request();
    }
  }

  void getContact() async {
    contacts = await ContactsService.getContacts();
  }
}
