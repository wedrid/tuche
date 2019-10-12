import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

import './grafico_accelerometro.dart';

class Accelerometer extends StatefulWidget{
  @override 
  _AccelerometerState createState() => _AccelerometerState();
}

class _AccelerometerState extends State<Accelerometer> {
  var xData = 0.0;
  var yData = 0.0;
  var zData = 0.0;
  var accelerationModule = 0.0; //VARIABILE DISCUTIBILMENTE PIÙ IMPORTANTE DI TUTTE, rappresenta il modulo di tutte le accelerazioni
  var maxAcceleration = 0.0;
  final accelerationThreshold = 23;

  GraficoAccelerometro grafx = GraficoAccelerometro();
  GraficoAccelerometro grafy = GraficoAccelerometro();
  GraficoAccelerometro grafz = GraficoAccelerometro();
  static DateTime lastUpdated = DateTime.now();

 // Card signal = ;

  @override
  void initState(){
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      
      setState(() {
        xData = event.x;
        grafx.notify(xData);
        yData = event.y;
        grafy.notify(yData);
        zData = event.z;
        grafz.notify(zData);
        accelerationModule = sqrt(pow(xData, 2) + pow(yData, 2) + pow(zData, 2));
        if(accelerationModule > maxAcceleration){
          maxAcceleration = accelerationModule;
          print(maxAcceleration);
        }

        if(accelerationModule > accelerationThreshold){
          print(accelerationModule);
          lastUpdated = DateTime.now();
        }

        //TODO volendo si può fare il grafico del modulo delle accelerazioni
      });
    });
  }

  @override 
  Widget build(BuildContext context){

    return Card(
      color: Colors.lightBlue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Accelerazioni  [m/s\u00B2]', style: TextStyle(fontWeight: FontWeight.bold),),
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
                //margin: EdgeInsets.all(7),
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
              child: Text("Last updated: " + lastUpdated.toString(), )
            ),
            //color: Colors.green,
            
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