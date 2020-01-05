import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
   Widget build(BuildContext context) { 
      Widget button2Container = Container(
        child:Column( children: [
    
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //implements on tap for every botton
              _buildButtonColumn(context,Colors.blue, Icons.find_in_page, 'Le tue preferite','/fifth',),

            ]),
      

      
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //implements on tap for every botton
                _buildButtonColumn(context,Colors.blue, Icons.find_in_page, 'find a tab','/second',),

                _buildButtonColumn(context,Colors.blue, Icons.add, 'add new tab','/third'),


                _buildButtonColumn(context,Colors.blue, Icons.share, 'SHARE this app','/fourth'),
              ]),
        
            Row(),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //implements on tap for every botton
                _buildButtonColumn(context,Colors.blue, Icons.find_in_page, 'Crea nuovo evento','/newevent',),

                _buildButtonColumn(context,Colors.blue, Icons.add, 'unisciti ','/addtoevent'),


                _buildButtonColumn(context,Colors.blue, Icons.share, 'Partecipa a un evento','/gotoevent'),
              ]),
          
        ]));



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
                      onTap: () {
                        // Update the state of the app
                        // ...
                      },
                    ),
                  ],
                ),
              ),


              body: Column (
                    
                  children: [
                    
                    titleSection,
                    button2Container
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
                  'Design by humans',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.blue[500],
          ),
          Text('41'),
        ],
      ),
    );
}




 GestureDetector _buildButtonColumn(BuildContext a,Color color, IconData icon, String label,String route,) {
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




 







 class  SharePage extends StatefulWidget {
  @override
  _SharePageState createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("Second Route"),
       ),
       body: Center(
         child: RaisedButton(
           onPressed: () {
             Navigator.pop(context);
             // Navigate back to first route when tapped.
           },
           child: Text('Go back!'),
         ),
       ),
     );
   }
}




 _launchURL() async {
   const url = 'https://www.matteobianchi.eu';
   if (await canLaunch(url)) {
     await launch(url);
   } else {
     throw 'Could not launch $url';
   }
 }


