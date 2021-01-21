import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './components/drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
         title: Text("Dashboard"),
       ),
       body: ListView(
         children: [
           Text("new"),

           CarouselSlider(
               items: [1,2,3,4,5].map((i) {
                 return Builder(
                   builder: (BuildContext context) {
                     return Container(
                         width: MediaQuery.of(context).size.width,
                         margin: EdgeInsets.symmetric(horizontal: 5.0),
                         decoration: BoxDecoration(
                             color: Colors.amber
                         ),
                         child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                     );
                   },
                 );
               }).toList(),
               options: CarouselOptions(
                 height: 400,
                 aspectRatio: 16/9,
                 viewportFraction: 0.8,
                 initialPage: 0,
                 enableInfiniteScroll: true,
                 reverse: false,
                 autoPlay: true,
                 autoPlayInterval: Duration(seconds: 4),
                 autoPlayAnimationDuration: Duration(milliseconds:1200),
                 autoPlayCurve: Curves.fastOutSlowIn,
                 enlargeCenterPage: true,
                 // onPageChanged: callbackFunction,
                 scrollDirection: Axis.horizontal,
               )
           ),
           Divider(
             color: Colors.black,
             height: 60,
             thickness: 1,
             indent: 20,
             endIndent:20,
           ),

         ],
       ),
       drawer: drawer(),
     ),
       );
  }
}