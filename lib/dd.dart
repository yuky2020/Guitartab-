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
    contact.name = map['name'];
    contact.dob = new DateFormat.yMd().parseStrict(map['dob']);
    contact.phone = map['phone'];
    contact.email = map['email'];
    contact.email = map['favoriteColor'];
    return contact;
  }

  String _toJson(Tabulatura contact) {
    var mapData = new Map();
    mapData["name"] = contact.name;
    mapData["dob"] = new DateFormat.yMd().format(contact.dob);
    mapData["phone"] = contact.phone;
    mapData["email"] = contact.email;
    mapData["favoriteColor"] = contact.favoriteColor;
    String json = JsonCodec().encode(mapData);
   print(json);
    return json;
  }
}
