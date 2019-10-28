import 'package:flutter/material.dart';
import 'package:tuche/logic/bool_switch.dart';
import 'package:tuche/providers/api_access.dart';
import 'package:tuche/widgets/accelerometer.dart';
import 'package:tuche/widgets/menu.dart';
import 'package:tuche/widgets/start_stop_button.dart';

import '../widgets/location_widget.dart';

class MonitoringPage extends StatelessWidget {
  final APIAccess apiAccess;
  final BoolSwitch interruttore = BoolSwitch();
  final LocationWidget lw = LocationWidget();
  final Switch sw = Switch(
    value: false,
    onChanged: (bool newValue) {
      
    },
  );

  MonitoringPage({this.apiAccess});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        drawer: Menu(apiAccess),
        appBar: AppBar(
          title: Text('Monitor'),
        ),
        body: Column(
          children: <Widget>[
            Accelerometer(
                interruttore: interruttore,
                apiAccess: apiAccess,
                locationWidget: lw),
            lw,
            //Card(child: Text('QUI CI SARANNO I DATI DEL GPS, LAT E LON'), color: Colors.orange),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                /*Image(
                  image: AssetImage('assets/image/car.png'),
                ),*/
                Row(
                  children: <Widget>[
                    Text('B'),
                    sw,
                    Text('M'),
                  ],
                ),
                
                StartStopButton(
                  interruttore: interruttore,
                ),
              ],
            ),
          ],
        ),
      ),
      onWillPop: () async => false,
    );
  }
}
