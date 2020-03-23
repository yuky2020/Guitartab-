import 'package:firebase_auth/firebase_auth.dart';

import 'Utente.dart';

class Evento{
  Evento(){this.numeroOsservanti=0;}
  FirebaseUser creator;
  DateTime data;
  String nomeEvento;
  String scaletta;
  String luogo; //penso che il luogo si possa indicare meglio
  List<String> utentiPartecipanti;
  List<String> utentiOsservanti;
  int numeroOsservanti;



}