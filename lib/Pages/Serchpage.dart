import 'package:flutter/material.dart';
class  SerchPage extends StatefulWidget {
  @override
  _SerchPageState createState() => _SerchPageState();
}

class _SerchPageState extends State<SerchPage> {
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Start a new serch"),
     ),
     body: Center(
       child: RaisedButton(
         onPressed: () {
           // Navigate back to first route when tapped.
         },
         child: Text('Go back!'),
       ),
     ),
   );
 }
}