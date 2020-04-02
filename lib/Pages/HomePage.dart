import 'package:GuitarTab/Data/Utente.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  final   FirebaseUser user;
  HomePage({Key key,@required this.user}):super(key :key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
   Widget build(BuildContext context) {
      Widget button2Container = Column(mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
    

           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //children: [
              //implements on tap for every botton
          Row(mainAxisAlignment: MainAxisAlignment.center,

              children:[
                Expanded(child:
               _buildButtonColumn(context,Colors.blue, Icons.find_in_page, 'Le tue preferite','/fifth',),),
                Expanded(child:
                _buildButtonColumn(context,Colors.blue, Icons.find_in_page, 'find a tab','/second',),),
                Expanded(child:
                _buildButtonColumn(context,Colors.blue, Icons.add, 'add new tab','/third',),),]),


          Row(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:CrossAxisAlignment.center,
              children:[
              Expanded(child:
              _buildButtonColumn(context,Colors.blue, Icons.share, 'SHARE this app','/fourth',),),
           ]),

          Row(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children:[
                Expanded(child:
            _buildButtonColumn(context,Colors.blue, Icons.find_in_page, 'Crea nuovo evento','/newevent',),),
              Expanded(child:
            _buildButtonColumn(context,Colors.blue, Icons.add, 'unisciti ','/addtoevent',),),
             Expanded(child:
            _buildButtonColumn(context,Colors.blue, Icons.share, 'Partecipa a un evento','/gotoevent',),),
            ]),
          
        ]);



      return MaterialApp(
          title: 'Guitar Tab',
          theme: new ThemeData(
            brightness: Brightness.dark
          //  primarySwatch: Colors.blue,
            //backgroundColor: Colors.black87,
            //primaryColor: Colors.black87,

          ),
          home: Scaffold(
           //   backgroundColor: Colors.black,
              drawer: Drawer(
                child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      child: Text('GuitarTab'),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                    ),
                    ListTile(
                      title: Text('Sito Sviluppatore'),
                      onTap : _launchURL,

                    ),
                    ListTile(
                      title: Text('Supporta lo svilupatore '),
                      onTap:() async{
                        const url = 'https://paypal.me/pools/c/8lvS2rGPNw';
                        if (await canLaunch(url)) {
                        await launch(url, forceSafariVC: false);
                                                  }
                        else { throw 'Could not launch $url';
                       }},

                    ),
                  ],
                ),
              ),


              body:  Column(
                  children: [
                    
                    titleSection,
                    button2Container,
                   Expanded(
                     child:Text(
                      widget.user.email ,
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    ),),
                  ]

              ),
          )

      );
    }

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Guitar tab for everyone',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Bentornato   '+Utente.user.email ,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/

          
        ],
      ),
    );
}




 GestureDetector _buildButtonColumn(BuildContext a,Color color, IconData icon, String label,String route) {
 return GestureDetector(
    onTap: (){
       Navigator.pushNamed(a, route,);

    },
    child: Column(
     mainAxisSize: MainAxisSize.min,

     mainAxisAlignment: MainAxisAlignment.center,
     children: [
       Icon(icon, color: color),
       Container(
         margin: const EdgeInsets.only(top: 8),
         child: Text(
           label,
           style: TextStyle(
             fontSize: 12,
             fontWeight: FontWeight.w400,
             color: color,
           ),
         ),
       ),
     ],
   )
       );

 }




 

 _launchURL() async {
   const url = 'https://www.matteobianchi.eu';
   if (await canLaunch(url)) {
     await launch(url);
   } else {
     throw 'Could not launch $url';
   }
 }


