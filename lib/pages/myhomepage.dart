import 'package:flutter/material.dart';
import 'package:tuche/widgets/navigation_button.dart';

import 'monitoring_page.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              //padding: EdgeInsets.all(10),
              height: 500,
              //color: Colors.blueAccent,
              child: Column(
                children: <Widget>[
                  NavigationButton(title: 'Vai al monitoring', onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MonitoringPage(),),);
                  },),
                  NavigationButton(title: 'Vai alla mappa', onPressed: null,),
                ],
              ),
            ),
          ],
        ),
      
    );
  }
}