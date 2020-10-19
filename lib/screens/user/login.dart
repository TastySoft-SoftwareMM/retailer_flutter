import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: "User"),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Password"),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("Login"),
              )
            ],
          ),
        ),
      ]),
    );
  }
}




