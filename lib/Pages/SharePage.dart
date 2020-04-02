import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class  SharePage extends StatefulWidget {
  @override
  _SharePageState createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'Guitar Tab',
        theme: new ThemeData(
            brightness: Brightness.dark ),

        home: Scaffold(
      appBar: AppBar(
        title: Text("L'app non é ancora in produzione "),
      ),
      body: Center(

        child:Column( mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("goditi la beta "),
              RaisedButton(
              onPressed: () {
              Navigator.pop(context);
               // Navigate back to first route when tapped.
              },
              child: Text('Go back!'),
             ),
              ])
            ),
            ));
  }
}
