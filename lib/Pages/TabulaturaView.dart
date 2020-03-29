import 'package:GuitarTab/Data/Tabulatura.dart';
import 'package:flutter/material.dart';

class TabulaturaView extends StatelessWidget{
  final Tabulatura tabulatura;
  TabulaturaView({Key key,@required this.tabulatura}):super(key :key);
  @override
  Widget build(BuildContext context){
      return new Scaffold(
          appBar: AppBar(
          title: Text(tabulatura.title ),
      ),
       body: Center(child: Container(
        child: Column(
         children:[
           Row(children: [
               Text(
               "tuning"+tabulatura.tuning ,
               style: TextStyle(
                 fontWeight: FontWeight.bold,

               )),
               Text(
                "capo"+tabulatura.capo ,
                 style: TextStyle(
                  fontWeight: FontWeight.bold,

               ),) ,

           ],),
           Text(
            tabulatura.getArtist() ,
            style: TextStyle(
              fontWeight: FontWeight.bold,

              )),
           Text(
            tabulatura.testo ,
              style: TextStyle(
               fontWeight: FontWeight.bold,

        ),) ,
           Text(
             tabulatura.creator ,
             style: TextStyle(
               fontWeight: FontWeight.bold,

             ),) ,




         ]) ))

      );


  }
}
