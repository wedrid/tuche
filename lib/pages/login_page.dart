
import 'package:flutter/material.dart';
import 'package:tuche/pages/monitoring_page.dart';
import 'package:tuche/providers/api_access.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  APIAccess autenticazione = new APIAccess();
  String username = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorLight,
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
    //print("STATUS BAR: " + MediaQuery.of(context).padding.top.toString());
    print("Username: " + this.username + " Password: " + this.password);
    if (this.username == "" || this.password == "") {
      setState(() {
        error = "Inserire username e password";

      });
      print(error);
      
    } else {
      await autenticazione.login(username, password);
      if (autenticazione.token == null) {
        setState(() {
          error = "Autenticazione fallita";

        });
        print(error);
        return;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MonitoringPage(
              apiAccess: this.autenticazione,
                  //title: 'TUCHE',
                  //token: autenticazione.token, //TODO: passare il token 
                ),
          ),
        ); //qui, prova il login, se successful allora vai avanti, altrimenti rimani qua
      }
    }

    //TODO sopra è da passarci il token
  }
}
