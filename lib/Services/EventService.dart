import 'package:GuitarTab/Data/Evento.dart';
import 'package:GuitarTab/viewmodels/CRUDModelEvent.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class EventService {
  final CRUDModelEvent crudEventi =  new CRUDModelEvent();
 

  Future<Evento> createEvent(Evento evento,FirebaseUser creator) async {
    evento.creator=creator.email;
    evento.utentiPartecipanti=new List();
    evento.utentiOsservanti=new List();
    evento.utentiPartecipanti.add(evento.creator);
    crudEventi.addEvento(evento);


    return evento ;
    }

    Future<List<Evento>> showEvents() {
      return crudEventi.fetchEvent();
    }

  }
