import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './components/drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class homescreen extends StatefulWidget{
  @override
  HomeScreen createState() => HomeScreen();
}


// ignore: camel_case_types
class HomeScreen extends State<homescreen> {
  List<bool> selected = List.generate(3, (_) => false);
  String firstName;
  SharedPreferences sharedPreference;

  Future setName() async{
    sharedPreference = await SharedPreferences.getInstance();
    setState(() {
      firstName = sharedPreference.getString('name');
    });


  }
  @override
  void initState() {
    setName();
    super.initState();
  }
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
           Text('$firstName'),

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
           Card(
             child: InkWell(
               splashColor: Colors.blue.withAlpha(30),
               onTap: () {
                 Navigator.popAndPushNamed(context, "/dynamicList");
               },
               child: Container(
                 color: Colors.blueAccent,
                 width: 300,
                 height: 100,
                 child: Center(
                  child: Text('A card that can be tapped'),
                 ),

               ),

             ),

           ),
           Divider(
             color: Colors.black,
             height: 60,
             thickness: 1,
             indent: 20,
             endIndent:20,
           ),
           SelectableText(
             'Hello! How are you?',
             textAlign: TextAlign.center,
             style: TextStyle(fontStyle: FontStyle.italic),
             toolbarOptions: ToolbarOptions(copy: true, selectAll: true),
             onTap: (){
              print("button tapped");
             }
           ),
           Divider(
             color: Colors.black,
             height: 60,
             thickness: 1,
             indent: 20,
             endIndent:20,
           ),
       DataTable(
         columns: const <DataColumn>[
           DataColumn(
             label: Text(
               'Name',
               style: TextStyle(fontStyle: FontStyle.italic),
             ),
           ),
           DataColumn(
             label: Text(
               'Age',
               style: TextStyle(fontStyle: FontStyle.italic),
             ),
           ),
           DataColumn(
             label: Text(
               'Role',
               style: TextStyle(fontStyle: FontStyle.italic),
             ),
           ),
         ],
         rows: const <DataRow>[
           DataRow(
             cells: <DataCell>[
               DataCell(Text('Sarah')),
               DataCell(Text('19')),
               DataCell(Text('Student')),
             ],
           ),
           DataRow(
             cells: <DataCell>[
               DataCell(Text('Janine')),
               DataCell(Text('43')),
               DataCell(Text('Professor')),
             ],
           ),
           DataRow(
             cells: <DataCell>[
               DataCell(Text('William')),
               DataCell(Text('27')),
               DataCell(Text('Associate Professor')),
             ],
           ),
         ],
       ),
           ToggleButtons(children: [
             Icon(Icons.local_cafe),
             Icon(Icons.fastfood),
             Icon(Icons.cake),
           ], isSelected: selected,
           color: Colors.grey,
           selectedColor: Colors.blueAccent,
           onPressed: (int index){
            setState(() {
              selected[index] = !selected[index];
            });
     },)


         ],
       ),
       drawer: drawer(),
     ),
       );
  }

}