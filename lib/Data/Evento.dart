import 'package:firebase_auth/firebase_auth.dart';


class Evento{
  Evento(){this.numeroOsservanti=0;}
  FirebaseUser creator;
  DateTime data=DateTime.now();
  String nomeEvento;
  String scaletta;
  String luogo; //penso che il luogo si possa indicare meglio
  List<String> utentiPartecipanti;
  List<String> utentiOsservanti;
  int numeroOsservanti;



  Evento.fromMap(Map snapshot,String id) :
        id = id ?? '',
        title = snapshot['title'] ?? '',
        artist = snapshot['artist'] ?? '',
        tuning = snapshot['tuning'] ?? '',
        capo  =  snapshot['capo'] ?? '' ,
        creator  =  snapshot['creator'] ?? '' ,
        testo  = snapshot['testo']  ?? '';


  toJson() {
    return {
      "title" : title,
      "artist" : artist,
      "tuning" : tuning ,
      "capo"   : capo,
      "creator" : creator,
      "testo"  :testo,
    };
  }


}