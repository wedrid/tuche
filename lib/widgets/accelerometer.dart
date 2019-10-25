import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'package:tuche/logic/bool_switch.dart';
import 'package:tuche/providers/api_access.dart';
import 'package:tuche/widgets/location_widget.dart';

import './grafico_accelerometro.dart';

class Accelerometer extends StatefulWidget {
  final BoolSwitch interruttore;
  final APIAccess apiAccess;
  final LocationWidget locationWidget;

  Accelerometer({this.interruttore, this.apiAccess, this.locationWidget});

  @override
  _AccelerometerState createState() => _AccelerometerState();
}

class _AccelerometerState extends State<Accelerometer> {
  //var last = DateTime.now();
  var diff = 0;
  var xData = 0.0;
  var yData = 0.0;
  var zData = 0.0;
  var localMax = 0.0; //è il massimo modulo locale
  var accelerationModule = 0.0; //VARIABILE DISCUTIBILMENTE PIÙ IMPORTANTE DI TUTTE, rappresenta il modulo di tutte le accelerazioni
  var maxAcceleration = 0.0;
  final accelerationThreshold = 23;
  var startTime;

  var maxx = 0.0, maxy = 0.0, maxz = 0.0;
  var maxLat, maxLon;

  GraficoAccelerometro grafx = GraficoAccelerometro();
  GraficoAccelerometro grafy = GraficoAccelerometro();
  GraficoAccelerometro grafz = GraficoAccelerometro();
  static DateTime lastUpdated = DateTime.now();

  // Card signal = ;

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        xData = event.x;
        grafx.notify(xData);
        yData = event.y;
        grafy.notify(yData);
        zData = event.z;
        grafz.notify(zData);
        accelerationModule =
            sqrt(pow(xData, 2) + pow(yData, 2) + pow(zData, 2));
        if (accelerationModule > maxAcceleration) {
          maxAcceleration = accelerationModule;
          //print(maxAcceleration);
        }

        //TODO IMPLEMENTARE LA LOGICA CHE PERMETTE DI CALCOLARE IL MAX IN UN INTERVALLO TEMPORALE
        //print(diff.toString());
        if(startTime != null){
          diff = (startTime.difference(DateTime.now()).inSeconds).abs();
        }
        //print(diff.toString());
        if (accelerationModule > accelerationThreshold &&
            widget.interruttore.isTrue()) { 
            if(startTime == null){
              startTime = DateTime.now();
            }
            print(diff.toString());
            if(diff >= 3){ 
              widget.apiAccess.inviaDati(
              maxLat,
              maxLon,
              maxx,
              maxy,
              maxz,
              localMax
              );
              maxLat = null;
              maxLon = null;
              maxx = 0;
              maxy = 0;
              maxz = 0;
              localMax = 0;
              startTime = null;
              diff = 0;
            } else { //altrimenti cerca il massimo
          if(accelerationModule > localMax){
            this.maxx = xData;
            this.maxy = yData;
            this.maxz = zData;
            this.localMax = accelerationModule;
            this.maxLat = widget.locationWidget.getCoordinates()['lat'];
            this.maxLon = widget.locationWidget.getCoordinates()['lon'];
            lastUpdated = DateTime.now();

            }
          }
          print(accelerationModule);
          print(lastUpdated.toString());
          
        }

        //FIXME: attenzione: è una logica molto fragile.
        
        if(diff >= 3){
              widget.apiAccess.inviaDati(
              maxLat,
              maxLon,
              maxx,
              maxy,
              maxz,
              localMax
              );
              maxLat = null;
              maxLon = null;
              maxx = 0;
              maxy = 0;
              maxz = 0;
              localMax = 0;
              startTime = null;
              diff = 0;
            }
            
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Accelerazioni  [m/s\u00B2]',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          //TODO probably refactor the following three cards, make a different class w/ pointer to sensor data
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('X: ' + xData.toStringAsFixed(5)),
                ),
                margin: EdgeInsets.all(7),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Y: ' + yData.toStringAsFixed(5)),
                ),
                margin: EdgeInsets.all(7),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Z:' + zData.toStringAsFixed(5)),
                ),
              ),
            ],
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(9),
              child: Text("Modulo: " + accelerationModule.toStringAsFixed(5)),
            ),
          ),
          Card(
            child: Container(
                padding: const EdgeInsets.all(9.0),
                constraints: BoxConstraints(
                  minWidth: 30,
                  minHeight: 40,
                ),
                child: Text(
                  "Last updated: " + lastUpdated.toString(),
                )),
          ),
          Column(
            children: <Widget>[
              grafx,
              grafy,
              grafz,
            ],
          ),
          /*RaisedButton(
            child: Text('Inizia accelerometro'),
            onPressed: () => startAccelerometer(),
            
          ),*/
        ],
      ),
    );
  }
}
