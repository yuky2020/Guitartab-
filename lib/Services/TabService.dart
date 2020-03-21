import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../Data/Tabulatura.dart';
import 'package:intl/intl.dart';


import '../Pages/AddPage.dart';
import 'package:firebase_database/firebase_database.dart';


class TabService {
 

  Future<Tabulatura> createTab(Tabulatura tab,FirebaseUser user) async {
    tab.creator=user;
    final databaseReference = FirebaseDatabase.instance.reference();
    DatabaseReference tabsData= databaseReference.child("tabs");
    tabsData.child(tab.getTitle()).set({
      'title': tab.getTitle(),
      'artist': tab.getArtist(),
      'tuning': tab.getTuning(),
      'testo': tab.getTesto(),
      'capo': tab.getCapo(),
      'creator':tab.getCreator().email


                                    });

    return tab;




    }
  }

