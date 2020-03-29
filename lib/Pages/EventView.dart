import 'package:GuitarTab/Data/Evento.dart';
import 'package:GuitarTab/Data/Tabulatura.dart';
import 'package:flutter/material.dart';

class EventView  extends StatelessWidget{
  final Evento evento;
  EventView({Key key,@required this.evento}):super(key :key);
  @override
  Widget build(BuildContext context){
    return new Scaffold(
        appBar: AppBar(
          title: Text(evento.nomeEvento ),
        ),
        body: Center(child: Container(
            child: Column(
                children:[
                  Row(children: [
                    Text(
                        "luogo  "+evento.luogo ,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,

                        )),
                    Text(
                      "data  "+evento.data.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,

                      ),) ,

                  ],),
                 //to implement for adding to the event or for adding as a singer to the event





                ]) ))

    );


  }
}
