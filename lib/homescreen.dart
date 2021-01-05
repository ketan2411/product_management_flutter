import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './components/drawer.dart';

class homescreen extends StatefulWidget{
  @override
  _homescreen createState() => _homescreen();
}

class _homescreen extends State<homescreen> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return WillPopScope(
       onWillPop: null,
     child: Scaffold(
       appBar: AppBar(
         title: Text("heelo"),
       ),
       body: Center(
         child: Text("hello"),
       ),
       drawer: drawer(),
     ),
       );
  }
}