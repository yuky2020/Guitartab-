import 'package:flutter/material.dart';
class  SerchLocalPage extends StatefulWidget {
  @override
  _SerchLocalPageState  createState() => _SerchLocalPageState();
}

class _SerchLocalPageState extends State<SerchLocalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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