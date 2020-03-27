import 'package:GuitarTab/Apifirestore/Api.dart';
import 'package:GuitarTab/Data/Evento.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CRUDModelEvent extends ChangeNotifier {
  Api _api = Api('event');

  List<Evento> evento;


  Future<List<Evento>> fetchEvent() async {
    var result = await _api.getDataCollection();
    evento = result.documents
        .map((doc) => Evento.fromMap(doc.data, doc.documentID))
        .toList();
    return evento;
  }

  Stream<QuerySnapshot> fetchEventAsStream() {
    return _api.streamDataCollection();
  }

  Future<Evento> getEventoById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Evento.fromMap(doc.data, doc.documentID) ;
  }


  Future removeEvento(String id) async{
    await _api.removeDocument(id) ;
    return ;
  }
  Future updateEvento(Evento data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addEvento(Evento data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }


