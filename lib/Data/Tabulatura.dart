 import 'package:firebase_auth/firebase_auth.dart';

class Tabulatura {
  String title;
  String artist;
  String tuning = '';
  String testo = '';
  String capo = '';
  FirebaseUser creator;

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
FirebaseUser getCreator(){
    return this.creator;
}

}
