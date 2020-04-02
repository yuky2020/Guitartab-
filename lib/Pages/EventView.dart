import 'package:GuitarTab/Data/Evento.dart';
import 'package:GuitarTab/Data/Tabulatura.dart';
import 'package:GuitarTab/Services/EventService.dart';
import 'package:GuitarTab/viewmodels/CRUDModelEvent.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'MyListViewer.dart';

class EventView  extends StatelessWidget{
  final Evento evento;
  final FirebaseUser user;
  final EventService serviziEvento= new EventService();
  EventView({Key key,@required this.evento,@required this.user}):super(key :key);
  @override
  Widget build(BuildContext context){
    return new  MaterialApp(
        title: evento.nomeEvento,
        theme: new ThemeData(
            brightness: Brightness.dark
          //  primarySwatch: Colors.blue,
          //backgroundColor: Colors.black87,
          //primaryColor: Colors.black87,

        ),
        home:Scaffold(
        appBar: AppBar(
          title: Text(evento.nomeEvento ),
        ),
        body: Center(child: Container(
            child: Column(
                children:[
                  Row(children: [
                    Text(
                        "     Luogo:  "+evento.luogo ,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,

                        )),
        ]),
                  Row(children: [
                    Text(
                      //metodo carino per far vedere solo giorno e  ora senza danni
                      "  Data  "+evento.data.toString().substring(0,(evento.data.toString().length-7)),
                         style: TextStyle(
                        fontWeight: FontWeight.bold,

                      ),) ,]),

                  Row(children:[
                    RaisedButton(
                      onPressed:() => serviziEvento.aggiungiPartecipante(user.email, evento),
                      child: Text("Partecipa sul palco"),),

                      RaisedButton(
                        onPressed:() => serviziEvento.aggiungiPublico(user.email, evento),
                        child: Text("Partecipa nel publico"),),


                      

                  ]),








                   Row(children: [Center( child:
                    Text(
                      "Creato Da  "+evento.creator,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,

                      ),) ,),

                    ]),

                   Row( children:[
                    RaisedButton(
                      onPressed:()=> Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyListViewer(lista:evento.utentiOsservanti))),
                    child:Text("partecipanti")     ),


                     RaisedButton(
                         onPressed:()=> Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyListViewer(lista:evento.utentiPartecipanti))),
                         child:Text("Artisti")     ),




                   ]),


                ]  ),),
                 //to implement for adding to the event or for adding as a singer to the event





                )
        )
    );


  }
}
