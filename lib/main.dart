
import 'package:GuitarTab/Pages/AddEvent.dart';
import 'package:GuitarTab/Pages/GoToEvent.dart';
import 'package:flutter/material.dart';


import 'Pages/AddPage.dart';
import 'Pages/AddToEvent.dart';
import 'Pages/HomePage.dart';
import 'Pages/Serchpage.dart';
import 'Pages/LoginPage.dart';
import 'Pages/serchlocal.dart';
import 'Data/Utente.dart';

void main() {

  runApp( MaterialApp( title: 'Guitar tab',
     // Start the app with the "/" named route. In our case, the app will start
     // on the FirstScreen Widget

     initialRoute: '/',
     routes: {
       // When we navigate to the "/" route, build the FirstScreen Widget
       '/': (context) => LoginPage(),
       '/LoginPage': (context) => LoginPage(),
       '/homePage': (context) => new HomePage( user: Utente.user ),
              // When we navigate to the "/second" route, build the SecondScreen Widget
              '/second': (context) => SerchPage(),
       
              // implementazione dell aggiunta di un elemento
       
              '/third': (context) => new AddPage(user:Utente.user),
              '/fourth':(context) => SharePage(),
              '/fifth':(context) => SerchLocalPage(),
              '/newevent':(context) =>new AddEvent(user:Utente.user),
              '/addtoevent': (context) =>AddToEvent(),
              '/gotoevent' : (context) => new GoToEvent(user: Utente.user,),

       
            }, ));

     }
       