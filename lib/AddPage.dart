
import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled1/dd.dart';
import 'dart:async';
import 'Tab.dart';


 class  AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _colors = <String>['', '1', '2', '3', '4','5','6','7'];
  String _color = '';
  Contact newContact=new Contact();

   @override
   Widget build(BuildContext context) {
     return Scaffold (
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
            icon: const Icon(Icons.person),
            hintText: 'Enter your first and last name',
            labelText: 'Name',
          ),
          inputFormatters: [new LengthLimitingTextInputFormatter(30)],
          validator: (val) => val.isEmpty ? 'Name is required' : null,
          onSaved: (val) => newContact.name = val,
        ),
        new Row(children: <Widget>[
          new Expanded(
              child: new TextFormField(
            decoration: new InputDecoration(
              icon: const Icon(Icons.calendar_today),
              hintText: 'Enter your date of birth',
              labelText: 'Dob',
            ),
            controller: _controller,
            keyboardType: TextInputType.datetime,
            validator: (val) =>
                isValidDob(val) ? null : 'Not a valid date',
            onSaved: (val) => newContact.dob = convertToDate(val),
          )),
          new IconButton(
            icon: new Icon(Icons.more_horiz),
            tooltip: 'Choose date',
            onPressed: (() {
              _chooseDate(context, _controller.text);
            }),
          )
        ]),
        new TextFormField(
          decoration: const InputDecoration(
            icon: const Icon(Icons.phone),
            hintText: 'Enter a phone number',
            labelText: 'Phone',
          ),
          keyboardType: TextInputType.phone,
          inputFormatters: [
            new WhitelistingTextInputFormatter(
                new RegExp(r'^[()\d -]{1,15}$')),
          ],
          validator: (value) => isValidPhoneNumber(value)
              ? null
              : 'Phone number must be entered as (###)###-####',
          onSaved: (val) => newContact.phone = val,
        ),
        new TextFormField(
          decoration: const InputDecoration(
            icon: const Icon(Icons.email),
            hintText: 'Enter a email address',
            labelText: 'Email',
          ),
          keyboardType: TextInputType.emailAddress,
          validator: (value) => isValidEmail(value)
              ? null
              : 'Please enter a valid email address',
          onSaved: (val) => newContact.email = val,
        ),
        new FormField<String>(
          builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: InputDecoration(
                icon: const Icon(Icons.color_lens),
                labelText: 'Color',
                errorText: state.hasError ? state.errorText : null,
              ),
              isEmpty: _color == '',
              child: new DropdownButtonHideUnderline(
                child: new DropdownButton<String>(
                  value: _color,
                  isDense: true,
                  onChanged: (String newValue) {
                    setState(() {
                      newContact.favoriteColor = newValue;
                      _color = newValue;
                      state.didChange(newValue);
                    });
                  },
                  items: _colors.map((String value) {
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
            return val != '' ? null : 'Please select a color';
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
                                  
       
       
       );
   }

     
  













void _submitForm() {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      showMessage('Form is not valid!  Please review and correct.');
    } else {
      form.save(); //This invokes each onSaved event

      print('Form save called, newContact is now up to date...');
      print('Email: ${newContact.name}');
      print('Dob: ${newContact.dob}');
      print('Phone: ${newContact.phone}');
      print('Email: ${newContact.email}');
      print('Favorite Color: ${newContact.favoriteColor}');
      print('========================================');
      print('Submitting to back end...');
      var contactService = new ContactService();
      contactService.createContact(newContact)
      .then((value) => 
        showMessage('New contact created for ${value.name}!', Colors.blue)
      );
    }
  }




    void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(backgroundColor: color, content: new Text(message)));
  }


}

isValidPhoneNumber(String value) {
}