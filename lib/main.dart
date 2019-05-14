
import 'package:flutter/material.dart';
import 'package:untitled1/AddPage.dart';
import 'package:untitled1/Serchpage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:untitled1/serchlocal.dart';



 void main() {
   runApp(MaterialApp(
     title: 'Guitar tab',
     // Start the app with the "/" named route. In our case, the app will start
     // on the FirstScreen Widget
     initialRoute: '/',
     routes: {
       // When we navigate to the "/" route, build the FirstScreen Widget
       '/': (context) => MyApp(),
       // When we navigate to the "/second" route, build the SecondScreen Widget
       '/second': (context) => SerchPage(),

       // implementazione dell aggiunta di un elemento

       '/third': (context) => AddPage(),
       '/fourth':(context) => SharePage(),
       '/fifth':(context) => SerchLocalPage(),

     },
   ));
 }

//Home per l'app
  class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    @override
    Widget build(BuildContext context) {
      Widget button2Section = Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //implements on tap for every botton
              _buildButtonColumn(context,Colors.purple, Icons.find_in_page, 'find a tab','/fifth',),

            ]),
      );

      Widget buttonSection = Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //implements on tap for every botton
                _buildButtonColumn(context,Colors.purple, Icons.find_in_page, 'find a tab','/second',),
                _buildButtonColumn(context,Colors.purple, Icons.add, 'add new tab','/third'),


                _buildButtonColumn(context,Colors.purple, Icons.share, 'SHARE this app','/fourth'),
              ]),
          );
      return MaterialApp(
          title: 'Guitar Tab',
          theme: new ThemeData(
          //  primarySwatch: Colors.purple,
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
                      child: Text('Como tu te iama io no se'),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                    ),
                    ListTile(
                      title: Text('Passa a premium'),
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


              body: Column(
                  children: [
                    titleSection,
                    buttonSection,

                  ]

              ),
              bottomNavigationBar: button2Section
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
            color: Colors.purple[500],
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
   const url = 'https://www.google.com';
   if (await canLaunch(url)) {
     await launch(url);
   } else {
     throw 'Could not launch $url';
   }
 }









   


 