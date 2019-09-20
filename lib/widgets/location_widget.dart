import 'package:flutter/material.dart';
import 'package:location/location.dart';


class LocationWidget extends StatefulWidget {
  @override
  _LocationWidgetState createState() => _LocationWidgetState();
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