import 'package:GuitarTab/Data/Tabulatura.dart';
import 'package:GuitarTab/Services/TabService.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:GuitarTab/Pages/TabulaturaView.dart'

class SerchPage extends StatelessWidget {

  final databaseReference = FirebaseDatabase.instance.reference().child("tabs");


  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Trova Tab'),
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
                     title: Text(snapshot.data[index].title),
                     subtitle: Text(snapshot.data[index].artist),
                     onTap: Navigator.
                     TabulaturaView( tabulatura: snapshot.data[index]),
                     
                     
                     );
                 },
                 

                                            );
                                            }}

      ),
      ), //center
    );
  }




  Future<List<Tabulatura>> getData() {
    TabService a = new TabService();
    return a.showTabs();
  }

}