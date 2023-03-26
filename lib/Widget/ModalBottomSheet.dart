// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, camel_case_types, sized_box_for_whitespace, sort_child_properties_last, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Small widgets/Card_Profile.dart';

show_modal_bottom_sheet(BuildContext context) {
  showModalBottomSheet(
      // isScrollControlled: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      context: context,
      builder: (ctx) {
        return Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Hero(tag: 'Hero', child: Card_Profile()),
                SizedBox(height: 25),
                Details_Person(),
              ],
            ),
          ),
        );
      });
}

class Details_Person extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        insider_detailed('Age', '21 ', 'Years', Icons.date_range),
        insider_detailed('Blood Type', 'B', ' -Ve', Icons.bloodtype),
        insider_detailed('Height', '182', ' cm', Icons.height),
        insider_detailed('weight', '75', ' kg', Icons.monitor_weight)
      ],
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
    );
  }

  Card insider_detailed(
      String description, String detail, String detailunit, IconData iconify) {
    return Card(
      elevation: 2,
      child: Container(
        height: 20,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  description,
                  style:
                      GoogleFonts.montserrat(color: Colors.grey, fontSize: 10),
                ),
                Row(
                  children: [
                    Text(
                      detail,
                      style: GoogleFonts.montserrat(
                          color: Colors.black, fontSize: 14),
                    ),
                    Text(
                      detailunit,
                      style: GoogleFonts.montserrat(
                          color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              iconify,
              color: Colors.red,
            )
          ],
        )),
      ),
    );
  }
}
