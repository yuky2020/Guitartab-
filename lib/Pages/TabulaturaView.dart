import 'package:GuitarTab/Data/Tabulatura.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class TabulaturaView extends StatelessWidget{
  final Tabulatura tabulatura;
  TabulaturaView({Key key,@required this.tabulatura}):super(key :key);
  @override
  Widget build(BuildContext context){
      return new MaterialApp(

          theme: new ThemeData(
          brightness: Brightness.dark
          //  primarySwatch: Colors.blue,
          //backgroundColor: Colors.black87,
          //primaryColor: Colors.black87,

      ),
    home:Scaffold(
          appBar: AppBar(
          title: Text(tabulatura.title ),
      ),
       body: Container( child:Center(child: Container(
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
           new Expanded(
               flex: 1,
               child:SingleChildScrollView(child:Text(tabulatura.testo)

           ) ),
           Text(
             tabulatura.creator ,
             style: TextStyle(
               fontWeight: FontWeight.bold,

             ),) ,




         ]) ))

      )));


  }
}
