import 'package:GuitarTab/Data/Evento.dart';
import 'package:GuitarTab/Services/EventService.dart';
import 'package:flutter/material.dart';

import 'EventView.dart';

class GoToEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Eventi vicino a te'),
      ),
      body: Container(
        child:FutureBuilder(
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
                    return ListTile(
                        title: Text(snapshot.data[index].nomeEvento),
                        subtitle: Text(snapshot.data[index].luogo),
                        onTap: (){ Navigator.push(context, new MaterialPageRoute(builder: (context) => new EventView(evento: snapshot.data[index])));}



                    );
                  },


                );
              }}

        ),
      ), //center
    );
  }




  Future<List<Evento>> getData() {
    EventService a = new EventService();
    return a.showEvents();
  }

}