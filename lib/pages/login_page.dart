

import 'package:flutter/material.dart';
import 'package:tuche/pages/myhomepage.dart';

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Container(
      color: Colors.orange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 200,
          ),
          Container(
            //height: 400,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                      child: Text('TUCHE - login',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                      ),
                    ),
                    Text('E-MAIL'),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'e-mail',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text('PASSWORD'),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton(
            child: Text('Login'),
            onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'TUCHE',),),);
                  },
          ),
        ],
      ),
    );
  }
  
}