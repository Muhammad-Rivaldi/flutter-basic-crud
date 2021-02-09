import 'package:flutter/material.dart';
import 'class_penangkap.dart';

class EntryForm extends StatefulWidget {
  final ClassPenangkap contact;

  EntryForm(this.contact);

  @override
  _EntryFormState createState() => _EntryFormState(this.contact);
}

class _EntryFormState extends State<EntryForm> {
  ClassPenangkap contact;

  _EntryFormState(this.contact);

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: contact == null ? Text('Tambah') : Text('Rubah'),
        leading: Icon(Icons.keyboard_arrow_left),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left:10.0, right:10.0),
        child: ListView(
          children: <Widget> [
            // nama
            Padding (
              padding: EdgeInsets.only(top:20.0, bottom:20.0),
              child: TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',             
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding (
              padding: EdgeInsets.only(top:20.0, bottom:20.0),
              child: TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Telepon',                
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding (
              padding: EdgeInsets.only(top:20.0, bottom:20.0),
              child: Row(
                children: <Widget> [
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Save',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        if (contact == null) {
                          contact = ClassPenangkap(nameController.text, phoneController.text);
                        } else {
                          contact.name = nameController.text;
                          contact.phone = phoneController.text;
                        }
                        Navigator.pop(context, contact);
                      },
                    ),
                  ),
                  Container(width: 5.0,),
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                    textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Cancel',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );

  }
}