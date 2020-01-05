import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Services/ContactService.dart';
import '../Data/Evento.dart';

class  AddToEvent extends StatefulWidget {
  @override
  _AddToEventState createState() => _AddToEventState();
}

class _AddToEventState extends State<AddToEvent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _color = '';
  Evento nuovoEvento=new Evento();

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(

      home :DefaultTabController(
  length: 3,
  child: Scaffold(
    appBar: AppBar(
      bottom: TabBar(
        tabs: [
          Tab(icon: Icon(Icons.directions_car)),
          Tab(icon: Icon(Icons.directions_transit)),
          Tab(icon: Icon(Icons.directions_bike)),
        ],
      ),
    ),
  ),
)
    );}}
        
