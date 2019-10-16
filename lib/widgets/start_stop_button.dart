import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tuche/logic/bool_switch.dart';

class StartStopButton extends StatefulWidget{
  final BoolSwitch interruttore;
  
  StartStopButton({this.interruttore});

  @override
  State<StartStopButton> createState() => _StartStopButtonState();
  
}

class _StartStopButtonState extends State<StartStopButton> {

  String startStop = "Avvia";
  @override
  Widget build(BuildContext context) {

    return RaisedButton(
      child: Text(startStop),
      onPressed: abilitaInvioAlServer,
    );
  }

  void abilitaInvioAlServer() {
    if(startStop == "Avvia"){
      setState(() {
        startStop = "Interrompi";
        widget.interruttore.setTrue();
      });
    }
    else {
      setState(() {
        startStop = "Avvia";
        widget.interruttore.setFalse();
      });
    }
  }
}