import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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
               itemCount: 15,
               itemBuilder: (BuildContext context, int index) {
                 return CheckboxListTile(
                   title: const Text('Animate Slowly'),
                   value: timeDilation != 1.0,
                   onChanged: (bool value) {
                     setState(() {
                       timeDilation = value ? 1.5 : 1.0;
                     });
                   },
                   secondary: const Icon(Icons.hourglass_empty),
                 );
               },
             ),
           );
         },
       ),
     ),
   );
  }

}
