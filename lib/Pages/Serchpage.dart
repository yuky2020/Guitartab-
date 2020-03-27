import 'package:GuitarTab/Services/TabService.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class SerchPage extends StatelessWidget {

  final databaseReference = FirebaseDatabase.instance.reference().child("tabs");


  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Trova Tab'),
      ),
      body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[


              RaisedButton(
                child: Text('View Record'),
                onPressed: () {
                  getData();
                },
              ),
              RaisedButton(
                child: Text('Udate Record'),
                onPressed: () {
                  updateData();
                },
              ),
              RaisedButton(
                child: Text('Delete Record'),
                onPressed: () {
                  deleteData();
                },
              ),
            ],
          )
      ), //center
    );
  }


  void getData(){
    TabService a= new TabService();
    a.showTabs();

    }


  void updateData(){
    databaseReference.child('1').update({
      'description': 'J2EE complete Reference'
    });
  }

  void deleteData(){
    databaseReference.child('1').remove();
  }
}