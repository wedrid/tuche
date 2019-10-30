import 'package:flutter/material.dart';
import 'package:tuche/logic/transportation_mode.dart';

class SwitchContainer extends StatefulWidget {
  final TransportationMode tm;

  SwitchContainer({this.tm});

  @override
  _SwitchContainerState createState() => _SwitchContainerState();
}

class _SwitchContainerState extends State<SwitchContainer> {
  bool state = false;
  @override
  Widget build(BuildContext context) {
    //String text = widget.state.toString();

    return RaisedButton(
      color: widget.tm.getColor(),
      child: Row(
        children: <Widget>[
          Container(
            child: Text(widget.tm.getMode() == 0 ? "Bicicletta" : "Macchina"),
            padding: EdgeInsets.only(right: 10),
          ),
          Image(
            image: AssetImage(widget.tm.getMode() == 0 ? 'assets/images/bicycle.png' : 'assets/images/car.png'),
            height: 20,
          ),
        ],
      ),
      onPressed: () {
        setState(() {
          widget.tm.setNextMode();
        });
      },
    );

    /*return Row(
      children: <Widget>[
        Text(state.toString()),
        Switch(
          value: false,
          onChanged: (bool newValue) {
            setState(() {
              if(state == false){
                newValue = true;
                state = true;
              } else {
                newValue = false;
                state = true;
              }
            });
          },
        ),
      ],
    );*/
  }
}
