import 'package:flutter/material.dart';

class DraggableScrollableView extends StatefulWidget {
  @override
  DraggableScrollableViewState createState() => DraggableScrollableViewState();
}

class DraggableScrollableViewState extends State<DraggableScrollableView> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text('DraggableScrollableSheet'),
     ),
     body: SizedBox.expand(
       child: DraggableScrollableSheet(
         builder: (BuildContext context, ScrollController scrollController) {
           return Container(
             color: Colors.blue[100],
             child: ListView.builder(
               controller: scrollController,
               itemCount: 25,
               itemBuilder: (BuildContext context, int index) {
                 return ListTile(title: Text('Item $index'));
               },
             ),
           );
         },
       ),
     ),
   );
  }

}
