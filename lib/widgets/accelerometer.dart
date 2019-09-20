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

  GraficoAccelerometro grafx = GraficoAccelerometro();
  GraficoAccelerometro grafy = GraficoAccelerometro();
  GraficoAccelerometro grafz = GraficoAccelerometro();

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