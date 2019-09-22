import 'package:flutter/material.dart';

import 'pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tuche',
      theme: ThemeData(primarySwatch: Colors.brown),
      //home: MyHomePage(title: 'Tuche - trova buche'),
      home: LoginPage(),
    );
  }
}


