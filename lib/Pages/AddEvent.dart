

import 'dart:io';

import 'package:GuitarTab/Services/EventService.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '../Services/TabService.dart';
import '../Data/Evento.dart';

class  AddEvent extends StatefulWidget {
  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _color = '';
  Evento nuovoEvento=new Evento();

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
        theme: new ThemeData(
            brightness: Brightness.dark

          //  primarySwatch: Colors.purple;
        ),

        home: Scaffold (

          //    backgroundColor: Colors.purple,


            key: _scaffoldKey,
            appBar: AppBar(
              title: Text("nuovo evento"),
            ),
            body: new SafeArea(
                top: false,
                bottom: false,
                child: new Form(
                    key: _formKey,
                    autovalidate: true,
                    child: new ListView(

                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      children: <Widget>[
                        new TextFormField(

                          decoration: const InputDecoration(
                            icon: const Icon(Icons.title),
                            hintText: 'Inserisci il nome dell evento',
                            labelText: 'Nome',


                          ),
                          inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                          validator: (val) => val.isEmpty ? 'Name is required' : null,
                          onSaved: (val) => nuovoEvento.nomeEvento= val,

                        ),
                        new Row(children: <Widget>[
                          new Expanded(
                              child: new TextFormField(
                                decoration: new InputDecoration(
                                  icon: const Icon(Icons.account_box),
                                  hintText: 'inserisci la scaletta',
                                  labelText: 'scaletta',
                                ),
                                inputFormatters: [new LengthLimitingTextInputFormatter(30)],

                                validator: (val) => val.isEmpty ? 'inserisci jam se e una jem session':null,

                                onSaved: (val) => nuovoEvento.scaletta = val,
                              )),



                        ]),
                      
                       
                       
                        new Container(
                            padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                            child: new RaisedButton(
                              child: const Text('Submit'),
                              onPressed: _submitForm,
                            )),
                      ],
                    )))



        ));
  }
















  void _submitForm() {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      showMessage('Form is not valid!  Please review and correct.');
    } else {
      localSave(nuovoEvento);
      form.save(); //This invokes each onSaved event

      

      var EventService = new prefix0.EventService();
      EventService.createEvent(nuovoEvento)
          .then((value) =>
          showMessage('New Event created ${value.nomeEvento}!', Colors.blue)
      );
    }
  }




  void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(backgroundColor: color, content: new Text(message)));
  }




  final TextEditingController _controller = new TextEditingController();
  Future _chooseDate(BuildContext context, String initialDateString) async {
    var now = new DateTime.now();
    var initialDate = convertToDate(initialDateString) ?? now;
    initialDate = (initialDate.year >= 1900 && initialDate.isBefore(now) ? initialDate : now);

    var result = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: new DateTime(1900),
        lastDate: new DateTime.now());

    if (result == null) return;

    setState(() {
      _controller.text = new DateFormat.yMd().format(result);
    });
  }

  DateTime convertToDate(String input) {
    try
    {
      var d = new DateFormat.yMd().parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }
  }

  Future localSave(Evento newCEvento) async {
    final file =await _localFile;
    file.writeAsString(newCEvento.nomeEvento+newCEvento.scaletta);

  }}





Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}
Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/counter.txt');
}

Future<File> writeCounter(int counter) async {
  final file = await _localFile;

  // Write the file
  return file.writeAsString('$counter');
}
