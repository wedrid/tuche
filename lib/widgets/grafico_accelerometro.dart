import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:sensors/sensors.dart';
import 'package:oscilloscope/oscilloscope.dart';

class GraficoAccelerometro extends StatefulWidget {
  //final String asse;

  //GraficoAccelerometro({@required this.asse});
  _GraficoAccelerometroState stato;
  @override
  _GraficoAccelerometroState createState() {
    stato = _GraficoAccelerometroState();
    return stato;
  } 

  void notify(double amplitude){
    stato.notify(amplitude);
  }

}

class _GraficoAccelerometroState extends State<GraficoAccelerometro> {
  List<double> traceX = List();
 
  void notify(double amplitude){
    setState(() {
      if(traceX.length > 310){
        traceX.clear();
      }
      traceX.add(amplitude);
    });
  }
  /*
  @override
  initState() {
    super.initState();
    accelerometerEvents.listen( (AccelerometerEvent event){
      //print(widget.asse);
      
      switch(widget.asse){
        case 'x': {
          setState(() {
          traceX.add(event.x);              
        });
        }
        break;
        case 'y': {
          setState(() {
          traceX.add(event.y);              
        });
        }
        break;
        case 'z': {
          setState(() {
          traceX.add(event.z);              
        });
        }
        break;
        default: {
          print("ERRORE");
        } break;
      }
    });
  }*/

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Create A Scope Display
    Oscilloscope scopeOne = Oscilloscope(
      padding: 20.0,
      backgroundColor: Colors.black,
      traceColor: Colors.green,
      yAxisMax: 15.0,
      yAxisMin: -10.0,
      dataSet: traceX,
      showYAxis: true,
    );

 
    return Container(height: 100, child: scopeOne);

  }
}