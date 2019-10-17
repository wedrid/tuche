import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tuche/logic/report_lite.dart';

class APIAccess with ChangeNotifier {
  String token;
  DateTime _expiryDate; //quando il login sarà per bene, con il token che scade
  String _userId;
  bool error = true;

  Future<void> _authenticate(String username, String password) async {
    //permette di avere lo spinner loading correttamente
    const url = 'http://172.105.85.84/api/users/login';

    final response = await http.post(
      url,
      headers: {'Content-type': 'application/json'},
      body: json.encode({
        'username': username,
        'password': password,
      }),
    );
    final responseData = json.decode(response.body);
    print(responseData.toString());
    if (responseData['non_field_errors'] != null) {
      print("Attenzione");
      error = true;
    } else {
      error = false;
    }

    token = json.decode(response.body)['token'];
    //getReports();
    //print("TOKEN: " +  _token);
  }

  Future<void> login(String username, String password) async {
    return _authenticate(username, password); //return, sempre per lo spinner
  }

  //TODO aggiungere modulo dei vettori
  Future<void> inviaDati(var lat, var lon, var ix, var iy, var iz, var im) async {
    final response = await http.post(
      'http://172.105.85.84/api/map/create',
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Token ' + this.token,
      },
      body: json.encode({
        'lat': lat,
        'lon': lon,
        'intensity_x': ix,
        'intensity_y': iy,
        'intensity_z': iz,
        'intensity_module': im,
      }),
    );
  }

  Future<List<ReportLite>> getReports() async {
    var data = await http.get(
      "http://172.105.85.84/api/map/get_data",
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Token ' + this.token,
      },
    );
    var jsonData = json.decode(data.body);

    List<ReportLite> reports = [];

    for (var r in jsonData) {
      ReportLite report = ReportLite(
          date: r["time"].toString(),
          lat: r["lat"],
          lon: r["lon"],
          intensityModule: r["intensity_module"]);
      reports.add(report);
    }
    print(reports[0].date + reports[0].lat.toString() + reports[0].lon.toString() + reports[0].intensityModule.toString());
    return reports;
  }
}
