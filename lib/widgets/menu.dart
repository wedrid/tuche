import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tuche/pages/mappa.dart';
import 'package:tuche/pages/monitoring_page.dart';

class Menu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text("Tuche."),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          ListTile(
            title: Text('Monitoring'),
            onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MonitoringPage(),
                        ),
                      );
                      //Navigator.pop(context);
                    },
          ),
          ListTile(
            title: Text('Map'),
            onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Mappa(),
                        ),
                      );
                      //Navigator.pop(context);
                    },
          ),
        ],
      ),
      
    );
  }

  
}