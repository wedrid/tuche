import 'package:flutter/material.dart';
import 'package:tuche/widgets/navigation_button.dart';

import 'monitoring_page.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title, this.token}) : super(key: key);

  final String title;
  final String token;

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
          title: Text(title),
        );
    //print(this.token);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: appBar,
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            
              //padding: EdgeInsets.all(10),
              //height: 500,
              
                  NavigationButton(
                    appBarHeight: appBar.preferredSize.height,
                    statusBarHeight: MediaQuery.of(context).padding.top,
                    title: 'Vai al monitoring',
                    path: "assets/images/buche.jpg",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MonitoringPage(),
                        ),
                      );
                    },
                  ),
                  NavigationButton(
                    statusBarHeight: MediaQuery.of(context).padding.top,
                    path: "assets/images/map.png",
                    appBarHeight: appBar.preferredSize.height,
                    title: 'Vai alla mappa',
                    onPressed: () {},
                  ),
          ],
        ),
      ),
    );
  }
}
