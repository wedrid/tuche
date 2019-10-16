import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tuche/pages/monitoring_page.dart';
import 'package:url_launcher/url_launcher.dart';

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
            title: Text('Vai alla mappa'),
            onTap: () async {
              const url = 'http://172.105.85.84';
              if( await canLaunch(url)){
                await launch(url);
              } else {
                throw 'Non è stato possibile andare al sito $url';
              }
            },
          ),
        ],
      ),
      
    );
  }

  
}