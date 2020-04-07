import 'package:GuitarTab/Data/Evento.dart';
import 'package:GuitarTab/Services/EventService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'EventView.dart';

// ignore: must_be_immutable
class GoToEvent extends StatefulWidget {
  final searchController=new TextEditingController();
  String searchString = "";
  final   FirebaseUser user;
  GoToEvent({Key key,@required this.user}):super(key :key);
  @override
  _GoToEventState createState() => _GoToEventState();

}
class _GoToEventState extends State<GoToEvent> {
  @override
  Widget build(BuildContext context) {
    getData();
    return MaterialApp(
        title: "Eventi vicino a te ",
        theme: new ThemeData(
            brightness: Brightness.dark
          //  primarySwatch: Colors.blue,
          //backgroundColor: Colors.black87,
          //primaryColor: Colors.black87,

        ),
        home:Scaffold(
      appBar: AppBar(
        title: Text("Eventi vicino a te"),
      ),
      body: Container(
        child: Column(children:[
      TextField(
      onChanged: (value) {
        setState((){
        widget.searchString = value;
        });

        },
          controller: widget.searchController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
          ),

        ),

        new Expanded(
           flex: 1,
          child: FutureBuilder(
            future: getData(),
            builder:  (BuildContext  context, AsyncSnapshot snapshot){
              if(snapshot.data ==null ){
                return Container(
                    child:Center(
                        child:Text("Loading....")
                    )
                );}
              else{
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder:(BuildContext context ,int index){
                    return snapshot.data[index].nomeEvento.contains(widget.searchString) ?ListTile(
                        title: Text(snapshot.data[index].nomeEvento),
                        subtitle: Text(snapshot.data[index].luogo),
                        onTap: (){ Navigator.push(context, new MaterialPageRoute(builder: (context) => new EventView(evento: snapshot.data[index],user: widget.user,)));}



                    ):null;
                  },


                );
              }}

        ),
          ), //center
         ])
      )
        )
    )
    ;
  }}




  Future<List<Evento>> getData() {
    EventService a = new EventService();
    return a.showEvents();
  }

