import 'package:flutter/material.dart';
import 'package:productmanagement/homescreen.dart';

class login extends StatefulWidget {
  const login({ Key key }) : super(key: key);

  @override
  _login createState() => _login();
}

class _login extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          color: Theme.of(context).primaryColor,
          child: Text("Home"),
          onPressed: ()
            {
              Navigator.pushNamed(context, '/home');
            }
        ),
      ),
    );
  }
}