import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'Tab.dart';
import 'package:intl/intl.dart';


import 'AddPage.dart';

class ContactService {
  static const _serviceUrl = 'http://mockbin.org/echo';
  static final _headers = {'Content-Type': 'application/json'};

  Future<Tabulatura> createContact(Tabulatura contact) async {
    try {
      String json = _toJson(contact);
      final response =
          await http.post(_serviceUrl, headers: _headers, body: json);
      var c = _fromJson(response.body);
      return c;
    } catch (e) {
      print('Server Exception!!!');
      print(e);
      return null;
    }
  }

  Tabulatura _fromJson(String json) {
    Map<String, dynamic> map = JsonCodec().decode(json); 
    var contact = new Tabulatura();
    contact.artist = map['artist'];
    contact.title= map['title'];
    contact.tuning = map['tuning'];
    contact.testo = map['testo'];
    contact.capo = map['capo'];
    return contact;
  }

  String _toJson(Tabulatura contact) {
    var mapData = new Map();
    mapData["artist"] = contact.artist;
    mapData["title"] = contact.title;
    mapData["tuning"] = contact.tuning;
    mapData["testo"] = contact.testo;
    mapData["capo"] = contact.capo;
    String json = JsonCodec().encode(mapData);
   print(json);
    return json;
  }
}
