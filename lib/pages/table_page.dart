import 'package:flutter/material.dart';
import 'package:tuche/providers/api_access.dart';
import 'package:tuche/widgets/menu.dart';
import 'package:intl/intl.dart';

class TablePage extends StatefulWidget {
  APIAccess apiAccess;

  TablePage(this.apiAccess);

  @override
  State<StatefulWidget> createState() => TablePageState();
}

class TablePageState extends State<TablePage> {
  @override
  Widget build(BuildContext context) {
    AssetImage car = AssetImage('assets/images/car.png');
    AssetImage bike = AssetImage('assets/images/bicycle.png');
    AssetImage left = AssetImage('assets/images/tuche_logo2.png');

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
                    Image image;
                    if (snapshot.data[index].vehicleType == 0) {
                      image = Image(
                        image: bike,
                        height: 20,
                      );
                    } else if (snapshot.data[index].vehicleType == 1) {
                      image = Image(
                        image: car,
                        height: 20,
                      );
                    } else {
                      image = Image(
                        image: left,
                        height: 20,
                      );
                    }
                    DateTime data = DateTime.parse(snapshot.data[index].date);
                    print(data.toString());
                    return ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Text("Data: " + (DateFormat("yyyy-MM-dd hh:mm").format(data))),
                            padding: EdgeInsets.only(right: 20),
                          ),
                          image
                        ],
                      ),
                      subtitle: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Latitudine: " +
                                snapshot.data[index].lat.toString()),
                            Text("Longitudine: " +
                                snapshot.data[index].lon.toString()),
                            Text("Accelerazione (modulo): " +
                                snapshot.data[index].intensityModule
                                    .toStringAsFixed(4)),
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
      ),
      onWillPop: () async => false,
    );
  }
}
