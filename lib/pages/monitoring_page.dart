import 'package:flutter/material.dart';
import 'package:tuche/widgets/accelerometer.dart';
import 'package:tuche/widgets/menu.dart';

import '../widgets/location_widget.dart';

class MonitoringPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text('Monitor'),
      ),
      body: Column(
        children: <Widget>[
          Accelerometer(),
          LocationWidget(),
          //Card(child: Text('QUI CI SARANNO I DATI DEL GPS, LAT E LON'), color: Colors.orange),
          RaisedButton(child: Text('Avvia'), onPressed: null,),
        ],
      ),
    );
  }
  
}