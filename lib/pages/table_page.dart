import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuche/providers/api_access.dart';
import 'package:tuche/widgets/menu.dart';

class TablePage extends StatefulWidget {
  APIAccess apiAccess;

  TablePage(this.apiAccess);

  @override
  State<StatefulWidget> createState() => TablePageState();
}

class TablePageState extends State<TablePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
          child: Scaffold(
        appBar: AppBar(title: Text("I tuoi reports")),
        body: Container(
          child: FutureBuilder(
            future: widget.apiAccess.getReports(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(child: Text("Loading")),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text("Data: " + snapshot.data[index].date),
                      subtitle: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Latitudine: " + snapshot.data[index].lat.toString()),
                            Text("Longitudine: " + snapshot.data[index].lon.toString()),
                            Text("Accelerazione (modulo): " + snapshot.data[index].intensityModule.toString()),

                          ],
                        ),
                      ),
                      
                    );
                  },
                );
              }
            },
          ),
        ),
        drawer: Menu(widget.apiAccess),
      ), onWillPop: () async => false,
    );
  }
}
