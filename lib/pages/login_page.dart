import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tuche/pages/myhomepage.dart';
import '../providers/auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Auth autenticazione = new Auth();
  String username = "";
  String password = "";
  String error = "";

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
                      child: Text(
                        'TUCHE - login',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text('USERNAME'),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Username',
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 12.0),
                      ),
                      onSubmitted: (String s) => _faiLogin,
                      onChanged: (String str) {
                        this.username = str;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text('PASSWORD'),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 12.0),
                      ),
                      onChanged: (String str) {
                        this.password = str;
                      },
                      onSubmitted: (String s) => _faiLogin,
                    ),
                    Text(error),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton(
            child: Text('Login'),
            onPressed: _faiLogin,
            /*() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'TUCHE',),),); //qui, prova il login, se successful allora vai avanti, altrimenti rimani qua
                  },*/
          ),
        ],
      ),
    );
  }

  Future<void> _faiLogin() async {
    print("Username: " + this.username + " Password: " + this.password);
    if (this.username == "" || this.password == "") {
      print("Inserire username e password");
    } else {
      await autenticazione.login(username, password);
      if (autenticazione.token == null) {
        print("Autenticazione fallita");
        return;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(
                  title: 'TUCHE',
                  token: autenticazione.token,
                ),
          ),
        ); //qui, prova il login, se successful allora vai avanti, altrimenti rimani qua
      }
    }

    //TODO sopra è da passarci il token
  }
}
