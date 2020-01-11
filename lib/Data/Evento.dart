import 'Utente.dart';

class Evento{
  DateTime data;
  String nomeEvento;
  String scaletta;
  String luogo; //penso che il luogo si possa indicare meglio
  List<Utente> utentiPartecipanti;
  List<Utente> utentiOsservanti;
  int numeroOsservanti;
  Utente fondatore;

}