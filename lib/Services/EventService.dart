import 'package:GuitarTab/Data/Evento.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class EventService {
 

  Future<Evento> createEvent(Evento evento,FirebaseUser creator) async {
    evento.creator=creator;
    evento.utentiPartecipanti=new List();
    evento.utentiOsservanti=new List();
    evento.utentiPartecipanti.add(evento.creator.email);
    final databaseReference = FirebaseDatabase.instance.reference();
    DatabaseReference eventData= databaseReference.child("Event");
    eventData.child(evento.nomeEvento).set({
      'Nome': evento.nomeEvento,
      'luogo': evento.luogo,
      'scaletta': evento.scaletta,
      'partcipanti': evento.numeroOsservanti,
      'UtentiPartecipanti': evento.utentiPartecipanti,
      'data': evento.data,
      'creator':evento.creator.email,
      'UtentiOsservanti': evento.utentiOsservanti,


    });

    return evento ;
    }
  }
