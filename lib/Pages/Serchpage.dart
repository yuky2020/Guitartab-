import 'package:GuitarTab/Data/Tabulatura.dart';
import 'package:GuitarTab/Services/TabService.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:GuitarTab/Pages/TabulaturaView.dart' ;


class SerchPage extends StatefulWidget {
  final searchController=new TextEditingController();
  String searchString = "";
  final databaseReference = FirebaseDatabase.instance.reference().child("tabs");
  @override
  _SerchPageState createState() => _SerchPageState();

}
class _SerchPageState extends State<SerchPage> {
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
        title: Text('Trova Tab'),
      ),
      body: Container(

        child:Column(children:[
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
                    return snapshot.data[index].title.contains(widget.searchString) ? ListTile(
                     title: Text(snapshot.data[index].title),
                     subtitle: Text(snapshot.data[index].artist),
                     onTap: (){ Navigator.push(context, new MaterialPageRoute(builder: (context) => new TabulaturaView(tabulatura: snapshot.data[index])));}

                     
                     
                     ):null;
                 },
                 

                                            );
                                            }}

      ),),
  ])), //center
    ));
  }}




  Future<List<Tabulatura>> getData() {
    TabService a = new TabService();
    return a.showTabs();
  }
