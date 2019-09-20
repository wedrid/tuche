import 'package:flutter/material.dart';

import './widgets/navigation_button.dart';
import './pages/monitoring_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tuche',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: MyHomePage(title: 'Tuche - trova buche'),
    );
  }
}

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
