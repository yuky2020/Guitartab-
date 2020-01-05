import 'package:flutter/material.dart';
import 'package:GuitarTab/Data/Tabulatura.dart';
class  SerchLocalPage extends StatefulWidget {
  @override
  _SerchLocalPageState  createState() => _SerchLocalPageState();
}

class _SerchLocalPageState extends State<SerchLocalPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text('ListTile guide')),
        body: BodyWidget(),
      );}}
  

String horseUrl = 'https://i.stack.imgur.com/Dw6f7.png';   
String cowUrl = 'https://i.stack.imgur.com/XPOr3.png';
String camelUrl = 'https://i.stack.imgur.com/YN0m7.png';
String sheepUrl = 'https://i.stack.imgur.com/wKzo8.png';
String goatUrl = 'https://i.stack.imgur.com/Qt4JP.png';

class BodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(horseUrl),
          ),
          title: Text('Horse'),
          subtitle: Text('A strong animal'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('horse');
          },
          selected: true,
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(cowUrl),
          ),
          title: Text('Cow'),
          subtitle: Text('Provider of milk'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('cow');
          },
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(camelUrl),
          ),
          title: Text('Camel'),
          subtitle: Text('Comes with humps'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('camel');
          },
          enabled: false,
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(sheepUrl),
          ),
          title: Text('Sheep'),
          subtitle: Text('Provides wool'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('sheep');
          },
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(goatUrl),
          ),
          title: Text('Goat'),
          subtitle: Text('Some have horns'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('goat');
          },
        ),
      ],
    );
  }


  Future<ListTile>  mainaggioa( Tabulatura a) async {
   return ListTile( 
          leading: CircleAvatar(
            backgroundImage: NetworkImage(horseUrl),
          ),
          title: Text(a.getTitle()),
          subtitle: Text(a.artist),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('horse');
          },
          selected: true,
        );
       }
}