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


  Future<Tabulatura> createTab(Tabulatura tab, FirebaseUser user) async {
    tab.creator = user.email;
    CRUDModel a = new CRUDModel();
    a.addTabs(tab);
    return tab;
  }

  Future<List> showTabs() async {
    List wow;


    return wow;
  }


}

