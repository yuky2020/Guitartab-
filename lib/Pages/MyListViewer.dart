

import 'package:GuitarTab/Data/Evento.dart';
import 'package:flutter/material.dart';

class MyListViewer extends StatelessWidget {
  final List lista;

  MyListViewer({Key key, @required this.lista}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
          brightness: Brightness.dark
      ),
      home: Scaffold(
          body: ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(lista[index]),
                );
              })),);
  }
}
