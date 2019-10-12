import 'package:flutter/material.dart';
import 'package:tuche/widgets/navigation_button.dart';

import 'monitoring_page.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title, this.token}) : super(key: key);

  final String title;
  final String token;

  @override
  Widget build(BuildContext context) {
    //print(this.token);
    return WillPopScope(
      onWillPop: () async => false,
          child: Scaffold(
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
        
      ),
    );
  }
}