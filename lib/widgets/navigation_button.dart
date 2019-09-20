import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget{
  final String title;
  final Function onPressed;

  NavigationButton({@required this.title, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                onTap:
                    this.onPressed, //on tap vai alla seconda pagina, col monitoring dei sensori
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.blue[600],
                  elevation: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 200,
                        child: Text(
                          this.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.blue[100], fontSize: 20),
                        ),
                        padding: EdgeInsets.all(15),
                      ),
                    ],
                  ),
                ),
              );
  }
  
}