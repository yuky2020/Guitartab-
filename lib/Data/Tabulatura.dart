 import 'package:firebase_auth/firebase_auth.dart';

class Tabulatura {
  String title;
  String id;
  String artist;
  String tuning = '';
  String testo = '';
  String capo = '';
  String creator;

  String  getTitle(){
   return this.title;
 }
 String getArtist(){
   return this.artist;

}
  String getTuning(){
   return this.artist;

}

String getTesto(){
   return this.testo;
}
String getCapo(){
   return this.capo;
}
String getCreator(){
    return this.creator;
}

Tabulatura();
  Tabulatura.fromMap(Map snapshot,String id) :
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
