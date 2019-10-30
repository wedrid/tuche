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
      padding: EdgeInsets.only(top: 130),
      color: Theme.of(context).backgroundColor,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            //height: 400,
            child: Card(
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      //padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                      padding: EdgeInsets.only(bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image(
                            height: 80,
                            image: AssetImage("assets/images/tuche_logo.png"),
                          ),
                          Text(
                            'Tuche',
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).primaryColorDark),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    //Text('USERNAME'),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Username',
                        hintStyle: TextStyle(
                            color: Theme.of(context).hintColor, fontSize: 12.0),
                      ),
                      onSubmitted: (String s) => _faiLogin,
                      onChanged: (String str) {
                        this.username = str;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    //Text('PASSWORD'),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(
                            color: Theme.of(context).hintColor, fontSize: 12.0),
                      ),
                      onChanged: (String str) {
                        this.password = str;
                      },
                      onSubmitted: (String s) => _faiLogin,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(error, style: TextStyle(color: Theme.of(context).errorColor),),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 20, 0),
            width: 150,
            height: 45,
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: _faiLogin,
              /*() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'TUCHE',),),); //qui, prova il login, se successful allora vai avanti, altrimenti rimani qua
                    },*/
            ),
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
                  //token: autenticazione.token,// passare il token
                ),
          ),
        ); //qui, prova il login, se successful allora vai avanti, altrimenti rimani qua
      }
    }

    // sopra è da passarci il token
  }
}
