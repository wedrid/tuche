import 'package:flutter/material.dart';
import 'package:tuche/logic/bool_switch.dart';
import 'package:tuche/logic/transportation_mode.dart';
import 'package:tuche/providers/api_access.dart';
import 'package:tuche/widgets/accelerometer.dart';
import 'package:tuche/widgets/menu.dart';
import 'package:tuche/widgets/start_stop_button.dart';
import 'package:tuche/widgets/switch_container.dart';

import '../widgets/location_widget.dart';

class MonitoringPage extends StatelessWidget {
  final APIAccess apiAccess;
  final BoolSwitch interruttore = BoolSwitch();
  final LocationWidget lw = LocationWidget();
  static final TransportationMode tm = TransportationMode();

  final SwitchContainer sw = SwitchContainer(tm: tm,);

  MonitoringPage({this.apiAccess});

  @override
  Widget build(BuildContext context) {
    Accelerometer accelerometer = Accelerometer(
                interruttore: interruttore,
                apiAccess: apiAccess,
                locationWidget: lw,
                transportationMode: tm);
   // sw.getState();
    return WillPopScope(
      child: Scaffold(
        drawer: Menu(apiAccess),
        appBar: AppBar(
          title: Text('Monitor'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              accelerometer,
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
                      sw,
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
      ),
      onWillPop: () async => false,
    );
  }
}
