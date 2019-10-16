import 'package:flutter/material.dart';
import 'package:location/location.dart';


class LocationWidget extends StatefulWidget {
  final LatLon latLon = LatLon();
  @override
  _LocationWidgetState createState() => _LocationWidgetState();

  getCoordinates(){
    var map = {
      'lat': latLon.lat,
      'lon': latLon.lon,
    };
    return map;
  }

}

class LatLon {
  var lat = 0.0;
  var lon = 0.0;

  void setLatLon(String lat, String lon){
    this.lat = double.parse(lat);
    this.lon = double.parse(lon);
  }

}

class _LocationWidgetState extends State<LocationWidget> {

  Location location = Location();
  Map<String, double> currentLocation;

  _LocationWidgetState(){
    this.askFirstLocation();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    location.onLocationChanged().listen((value) {
      setState(() {
        currentLocation = value;
        widget.latLon.setLatLon(currentLocation['latitude'].toString(), currentLocation['longitude'].toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
      
    return Column(
        children: <Widget>[
          currentLocation == null
              ? CircularProgressIndicator()
              : Text("LAT: " + currentLocation["latitude"].toString() + ", LONG: " + currentLocation["longitude"].toString()),
        ],
      );
  }

  void askFirstLocation() async {
    currentLocation = await location.getLocation();

  }

}