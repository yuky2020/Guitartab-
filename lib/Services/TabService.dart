import 'package:GuitarTab/viewmodels/CRUDModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../Data/Tabulatura.dart';
import 'package:intl/intl.dart';


import '../Pages/AddPage.dart';
class TabService {

  static CRUDModel a = new CRUDModel();
  Future<Tabulatura> createTab(Tabulatura tab, FirebaseUser user) async {
    tab.creator = user.email;

    a.addTabs(tab);
    return tab;
  }

  Future<List<Tabulatura>> showTabs() async {
    return a.fetchTabs();
  }


}

