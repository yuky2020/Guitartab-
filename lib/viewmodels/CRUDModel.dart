import 'package:GuitarTab/Apifirestore/Api.dart';
import 'package:GuitarTab/Data/Tabulatura.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CRUDModel extends ChangeNotifier {
  Api _api = Api('tabs');

  List<Tabulatura> tab;


  Future<List<Tabulatura>> fetchTabs() async {
    var result = await _api.getDataCollection();
    tab = result.documents
        .map((doc) => Tabulatura.fromMap(doc.data, doc.documentID))
        .toList();
    return tab;
  }

  Stream<QuerySnapshot> fetchTabsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Tabulatura> getTabsById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Tabulatura.fromMap(doc.data, doc.documentID) ;
  }


  Future removeTabs(String id) async{
    await _api.removeDocument(id) ;
    return ;
  }
  Future updateTabs(Tabulatura data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addTabs(Tabulatura data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }


}