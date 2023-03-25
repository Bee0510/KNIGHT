// ignore_for_file: non_constant_identifier_names, unnecessary_new, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:location/location.dart';

class LocationProvider with ChangeNotifier {
  Location? _location;
  Location? get location => _location;

  LatLng? _loactionPosition;
  LatLng? get loactionPosition => _loactionPosition;

  bool IsServiceAvailable = true;

  LocationProvider() {
    _location = new Location();
  }

  initialize() async {
    await getUserLocation();
  }

  getUserLocation() async {
    bool _serviceEnabled;
    PermissionStatus _PermissionGranted;
    _serviceEnabled = await location!.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location!.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _PermissionGranted = await location!.hasPermission();
    if (_PermissionGranted == PermissionStatus.denied) {
      _PermissionGranted = await location!.requestPermission();
      if (_PermissionGranted != PermissionStatus.denied) {
        return;
      }
    }
    location!.onLocationChanged.listen((LocationData currentLocation) {
      _loactionPosition = LatLng(
        currentLocation.latitude!,
        currentLocation.longitude!,
      );
      notifyListeners();
    });
  }
}
