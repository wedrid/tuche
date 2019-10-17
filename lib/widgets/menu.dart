import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tuche/pages/monitoring_page.dart';
import 'package:tuche/pages/table_page.dart';
import 'package:tuche/providers/api_access.dart';
import 'package:url_launcher/url_launcher.dart';

class Menu extends StatelessWidget{
  APIAccess apiAccess;
  Menu(this.apiAccess);
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
          ListTile(
            title: Text('I tuoi reports'),
            onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TablePage(this.apiAccess),
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