import 'package:firebase_auth/firebase_auth.dart';


class Evento{

  String id;
  String creator;
  DateTime data=DateTime.now();
  String nomeEvento;
  String scaletta;
  String luogo; //penso che il luogo si possa indicare meglio
  List<String> utentiPartecipanti;
  List<String> utentiOsservanti;
  int numeroOsservanti;

  Evento(){this.numeroOsservanti=0;}

  Evento.fromMap(Map snapshot,String id) :
        id = id ?? '',
        creator = snapshot['creator'] ?? '',
        data = snapshot['data'] ?? '',
        nomeEvento= snapshot['nomeEvento'] ?? '',
        luogo  =  snapshot['luogo'] ?? '' ,
        utentiPartecipanti  =  snapshot['utentiPartecipanti'] ?? '' ,
        utentiOsservanti  = snapshot['utentiOsservanti']  ?? '',
        numeroOsservanti =snapshot['numeroOsservanti'] ??'';


  toJson() {
    return {
      "creator" : creator,
      "data" : data,
      "nomeEvento" : nomeEvento ,
      "luogo"   : luogo,
      "utentiPartecipanti" : utentiPartecipanti,
      "utentiOsservanti"  : utentiOsservanti,
      "numeroOsservanti"  : numeroOsservanti ,
    };
  }


}