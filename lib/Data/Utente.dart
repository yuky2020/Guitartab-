
import 'package:firebase_auth/firebase_auth.dart';

class Utente {
    static FirebaseUser user;
   void setUser(FirebaseUser usesr){
     user=usesr ;

   }

   FirebaseUser getUser(){
     return user;
}

}