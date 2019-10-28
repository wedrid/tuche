import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/login_page.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
  //runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tuche',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      //home: MyHomePage(title: 'Tuche - trova buche'),
      home: LoginPage(),
    );
  }
}
