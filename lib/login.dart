import 'package:flutter/material.dart';
import 'package:productmanagement/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';



class login extends StatefulWidget {
  const login({ Key key }) : super(key: key);

  @override
  _login createState() => _login();
}

class _login extends State<login> {



  TextEditingController _namecontroller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: new EdgeInsets.symmetric(horizontal: 20.0),
        padding: new EdgeInsets.fromLTRB(0,50,000,0),

        child: ListView(
          children: [
        TextField(
        decoration: InputDecoration(
        border: InputBorder.none, hintText: 'Enter a search term',

        ),
          controller: _namecontroller,
      ),

        RaisedButton(
        color: Theme.of(context).primaryColor,
        child: Text("Home"),
        onPressed: () async
        {  var name = _namecontroller.text;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('name', name);
          Navigator.pushNamed(context, '/home');
        }),

          ],
        ),

      ),
    );
  }
  @override
  void initState() {
    _namecontroller = new TextEditingController();
    super.initState();
  }
  @override
  void setState(fn) {
    if(mounted){
      super.setState(fn);
    }
  }
  @override
  void dispose(){
    _namecontroller?.dispose();

    super.dispose();
  }
}