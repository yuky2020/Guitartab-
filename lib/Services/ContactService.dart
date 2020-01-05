import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../Data/Tabulatura.dart';
import 'package:intl/intl.dart';


import '../Pages/AddPage.dart';

class ContactService {
 

  Future<Tabulatura> createContact(Tabulatura contact) async {
    Tabulatura a=new Tabulatura();
    a=contact;
    }
  }

