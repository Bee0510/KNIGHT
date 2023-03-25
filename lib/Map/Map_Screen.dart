// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_const_constructors, depend_on_referenced_packages, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sos/Map/Map_Provider.dart';
import 'package:sos/Widget/loader.dart';

class Map_Screen extends StatefulWidget {
  const Map_Screen({super.key});

  @override
  State<Map_Screen> createState() => _Map_ScreenState();
}

class _Map_ScreenState extends State<Map_Screen> {
  late GoogleMapController _controller;
  LatLng SourceLocation = LatLng(22.2533398, 84.9102307);
  LatLng DestinationLocation = LatLng(22.2533917, 85.9104433);
  String google_api_key = 'AIzaSyBjC8sN5QieC0z-a3SDrAGMAyztAU_EmKs';
  List<LatLng> _coordinate = [];

  void getPolyline() async {
    PolylinePoints _polyline = PolylinePoints();
    PolylineResult result = await _polyline.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(SourceLocation.latitude, SourceLocation.longitude),
      PointLatLng(DestinationLocation.latitude, DestinationLocation.longitude),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) => _coordinate.add(
            LatLng(
              point.latitude,
              point.longitude,
            ),
          ));
      setState(() {});
    }
  }

  @override
  void initState() {
    Provider.of<LocationProvider>(context, listen: false).initialize();
    getPolyline();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(builder: (context, value, child) {
      if (value.location != null) {
        return Center(
          child: Container(
            height: 600,
            child: GoogleMap(
              onMapCreated: (controller) {
                setState(() {
                  _controller = controller;
                });
              },
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                  target: LatLng(22.2533398, 84.9102307), zoom: 18),
              markers: {
                Marker(markerId: MarkerId("source"), position: SourceLocation),
                Marker(
                    markerId: MarkerId("Destination"),
                    position: DestinationLocation),
              },
              polylines: {
                Polyline(
                  visible: true,
                  polylineId: PolylineId('Route'),
                  points: _coordinate,
                  color: Colors.blue,
                  width: 5,
                  startCap: Cap.roundCap,
                  endCap: Cap.buttCap,
                )
              },
            ),
          ),
        );
      } else {
        return Loader();
      }
    });
  }
}
