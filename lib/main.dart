import 'package:GuitarTab/Pages/AddEvent.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'Pages/AddPage.dart';
import 'Pages/AddToEvent.dart';
import 'Pages/HomePage.dart';
import 'Pages/Serchpage.dart';
import 'Pages/LoginPage.dart';
import 'Pages/serchlocal.dart';

void main() { runApp( MaterialApp( title: 'Guitar tab',
     // Start the app with the "/" named route. In our case, the app will start
     // on the FirstScreen Widget
     initialRoute: '/',
     routes: {
       // When we navigate to the "/" route, build the FirstScreen Widget
       '/': (context) => LoginPage(),
       '/LoginPage': (context) => LoginPage(),
       '/homePage': (context) => HomePage(),
              // When we navigate to the "/second" route, build the SecondScreen Widget
              '/second': (context) => SerchPage(),
       
              // implementazione dell aggiunta di un elemento
       
              '/third': (context) => AddPage(),
              '/fourth':(context) => SharePage(),
              '/fifth':(context) => SerchLocalPage(),
              '/newevent':(context) =>AddEvent(),
              '/addtoevent': (context) =>AddToEvent()

       
            }, ));
        }
       