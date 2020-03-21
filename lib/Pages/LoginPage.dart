import 'package:GuitarTab/Auth/Auth.dart';
import 'package:GuitarTab/Data/Utente.dart';
import 'package:GuitarTab/Pages/HomePage.dart';
import 'package:GuitarTab/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
 final String  error ;
  LoginPage({Key key,  this.error}):super(key :key);
  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  var authHandler = new Auth();
  final emailController= TextEditingController();
  final passwordController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(size: 150),
              SizedBox(height: 50),

               Container(
    padding: EdgeInsets.all(20.0),
    child: Column(
      children: <Widget>[
        Text(
          'Login Information',
          style: TextStyle(fontSize: 20),
        ),
         if(widget.error!=null)Text(widget.error, style: TextStyle(fontSize: 20,color:Colors.red),),
        TextFormField(
           controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(labelText: "Email Address")),

        TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(labelText: "Password")),
        RaisedButton(child: Text("LOGIN"), onPressed: ()
    {
        authHandler.handleSignInEmail(emailController.text, passwordController.text).then((FirebaseUser user) {
          if(user!=null){
            new Utente().setUser(user);
         Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomePage(user: user)));}
          else{Navigator.push(context, new MaterialPageRoute(builder: (context) => new LoginPage(error:'Credenziali non valide')));}
   }).catchError((e) => print(e));
           {
        Navigator.of(context).push(
        MaterialPageRoute(
        builder: (context) {
        return LoginPage(error: "credenziali non valide",);
        },
        ),
        );

        }}),
        RaisedButton(child: Text("SignUp"), onPressed: ()
        {
          authHandler.handleSignUp(emailController.text, passwordController.text).then((FirebaseUser user) {
            if(user!=null){

              Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomePage(user: user)));}
            else{Navigator.push(context, new MaterialPageRoute(builder: (context) => new LoginPage(error:'Account gia esistente ')));}
          }).catchError((e) => print(e));
          {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return LoginPage();
                },
              ),
            );

          }}),
      ],
    ),
  ),
            ],
          ),
        ),
      ),
    );
  }

  
}


