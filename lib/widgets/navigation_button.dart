import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final double appBarHeight;
  final double statusBarHeight;
  final String path;

  NavigationButton(
      {@required this.title,
      @required this.onPressed,
      @required this.appBarHeight,
      @required this.statusBarHeight,
      @required this.path});

  @override
  Widget build(BuildContext context) {
    print(statusBarHeight);
    /*return RaisedButton(
                color: Theme.of(context).primaryColorLight,
                
                  /*shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),*/
                  //margin: EdgeInsets.only(top: 10, bottom: 10),
                  //onPressed: this.onPressed, //on tap vai alla seconda pagina, col monitoring dei sensori
                  onPressed: (){ print( MediaQuery.of(context).padding.top.toString()); },
                  //elevation: 15,
                  child:
                      Container(
                        //height: double.INFINITY,
                        height: (MediaQuery.of(context).size.height - appBarHeight - statusBarHeight)/2,
                        width: MediaQuery.of(context).size.width,
                        //height: (MediaQuery.of(context).size.height - AppBar().preferredSize.height)/2 -10,
                        child: Text(
                          this.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        //padding: EdgeInsets.all(15),
                      ),
                    
              
              );*/
    return Stack(
      children: <Widget>[
        //type: MaterialType.transparency,
        Container(
          height: (MediaQuery.of(context).size.height -
                  appBarHeight -
                  statusBarHeight) /
              2 -30,
          width: MediaQuery.of(context).size.width,
          //color: Colors.blue,
          //type: MaterialType.transparency,
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.all(Radius.circular(30)),
            image: DecorationImage(
              image: new AssetImage(path),
              fit: BoxFit.fill,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0, // has the effect of softening the shadow
                spreadRadius: 0.0, // has the effect of extending the shadow
                offset: Offset(
                  3.0, // horizontal, move right 10
                  5.0, // vertical, move down 10
                ),
          )
        ],
          ),
        ),

        Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
            borderRadius: new BorderRadius.all(Radius.circular(30)),),
            height: (MediaQuery.of(context).size.height -
                  appBarHeight -
                  statusBarHeight) /
              2 -30,
            width: MediaQuery.of(context).size.width,
            //color: Colors.yellow,
            child: InkWell(
              child: Text("Hello"),
              onTap: () {},
            ),
            //
          ),
        ),
      ],
    );
  }
}
