import 'package:flutter/material.dart';
import 'package:tuche/widgets/accelerometer.dart';

class TransportationMode{
  
  
  //String mode = "Macchina";
  var mode = 0; 
  final total = 2;
  //1: macchina, 0: bicicletta, etc.
  TransportationMode(){
    mode = 1;
  }

  int getMode(){
    return this.mode;
  }

  void setNextMode(){
    this.mode = (this.mode+1) % total;
  }

  Color getColor(){
    switch(mode){
      case 0:
        return Colors.green;
      case 1:
        return Colors.grey;
    }
    return Colors.white;
  }

  int getThreshold(){
    switch(mode){
      case 0:
        return 23;
      case 1:
        return 15;

    }

    return 23; //di default ritorna 23

  }

}