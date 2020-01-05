
import 'dart:core';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import '../Data/Tabulatura.dart';
import 'package:path_provider/path_provider.dart';
import '../Services/ContactService.dart';


 class  AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _capo = <String>['','0', '1', '2', '3', '4','5','6','7','8','9','10','11','12','13','14','15'];
  String _color = '';
  Tabulatura newContact=new Tabulatura();

   @override
   Widget build(BuildContext context) {

     return new MaterialApp(
         theme: new ThemeData(
         //  primarySwatch: Colors.purple;
         ),

          home: Scaffold (

   //    backgroundColor: Colors.purple,


        key: _scaffoldKey,
        appBar: AppBar(
         title: Text("Tab Adder"),
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
            hintText: 'Enter the title',
            labelText: 'Title',


          ),
          inputFormatters: [new LengthLimitingTextInputFormatter(30)],
          validator: (val) => val.isEmpty ? 'Name is required' : null,
          onSaved: (val) => newContact.title = val,

        ),
        new Row(children: <Widget>[
          new Expanded(
              child: new TextFormField(
            decoration: new InputDecoration(
              icon: const Icon(Icons.account_box),
              hintText: 'Enter the Artist',
              labelText: 'Artist',
            ),
                inputFormatters: [new LengthLimitingTextInputFormatter(30)],

                validator: (val) => val.isEmpty ? 'Artist is requied':null,

            onSaved: (val) => newContact.artist = val,
          )),



        ]),
        new TextFormField(
          decoration: const InputDecoration(
            icon: const Icon(Icons.phone),
            hintText: 'Enter the tuning',
            labelText: 'Tuning',
          ),
          keyboardType: TextInputType.multiline,
          inputFormatters: [
            new WhitelistingTextInputFormatter(
                new RegExp(r'^[()\d -]{1,15}$')),
          ],
          validator: (value) => true
              ? null
              : 'Phone number must be entered as (###)###-####',
          onSaved: (val) => newContact.tuning = val,
        ),
        new TextFormField(
          decoration: const InputDecoration(
            icon: const Icon(Icons.disc_full),
            hintText: 'Enter Tab',
            labelText: 'Tab',
          ),
           keyboardType: TextInputType.multiline ,
           minLines: 15,
           maxLines: null,
          validator: (value) => true
              ? null
              : 'Please enter a valid email address',
          onSaved: (val) => newContact.testo = val,
        ),
        new FormField<String>(
          builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: InputDecoration(
                icon: const Icon(Icons.color_lens),
                labelText: 'Capo',
                errorText: state.hasError ? state.errorText : null,
              ),
              isEmpty: _color == '',
              child: new DropdownButtonHideUnderline(
                child: new DropdownButton<String>(
                  value: _color,
                  isDense: true,
                  onChanged: (String newValue) {
                    setState(() {
                      newContact.capo = newValue;
                      _color = newValue;
                      state.didChange(newValue);
                    });
                  },
                  items: _capo.map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                ),
              ),
            );
          },
          validator: (val) {
            return val != '' ? null : 'Please select a capo';
          },
        ),
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
                    localSave(newContact);
                                        form.save(); //This invokes each onSaved event
                                  
                                        print('Form save called, newTab is now up to date...');
                                        print('Title: ${newContact.title}');
                                        print('artist: ${newContact.artist}');
                                        print('tuning: ${newContact.tuning}');
                                        print('testo: ${newContact.testo}');
                                        print('Capo: ${newContact.capo}');
                                        print('========================================');
                                        print('Submitting to back end...');
                                        
                                        var contactService = new ContactService();
                                        contactService.createContact(newContact)
                                        .then((value) => 
                                          showMessage('New Tab created for ${value.title}!', Colors.blue)
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
                    
                      Future localSave(Tabulatura newContact) async {
                        final file =await _localFile;
                        file.writeAsString(newContact.artist+newContact.capo+newContact.testo);

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



  // create the illusion of a beautifully scrolling text box
  /* return new Container(
    color: Colors.gray,
  padding: new EdgeInsets.all(7.0),

  child: new ConstrainedBox(
    constraints: new BoxConstraints(
      minWidth: _contextWidth(),
      maxWidth: _contextWidth(),
      minHeight: AppMeasurements.isLandscapePhone(context) ? 25.0 : 25.0,
      maxHeight: 55.0,
    ),

    child: new SingleChildScrollView(
      scrollDirection: Axis.vertical,
      reverse: true,

        // here's the actual text box
        child: new TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null, //grow automatically
          focusNode: mrFocus,
          controller: _textController,
          onSubmitted: currentIsComposing ? _handleSubmitted : null,
          decoration: new InputDecoration.collapsed(
            hintText: ''Please enter a lot of text',
          ),
        ),
        // ends the actual text box

      ),
    ),
  );
}*/
//keyboardType: TextInputType.multiline,
//maxLines: null,
