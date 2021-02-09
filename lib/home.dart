import 'package:flutter/material.dart';
import 'dart:async';
import 'crud.dart';
import 'class_penangkap.dart';
import 'enter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CRUD dbHelper = CRUD();
  Future<List<ClassPenangkap>> future;
  @override
  void initState() {
    super.initState();
    updateListView();
  }

  void updateListView() {
    setState(() {
      future = dbHelper.getContactList();
    });
  }

  Future<ClassPenangkap> navigateToEntryForm(
      BuildContext context, ClassPenangkap contact) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryForm(contact);
    }));
    return result;
  }

  Card cardo(ClassPenangkap contact) {
    return Card(
      color: Colors.white,
      elevation: 2.0,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.red,
          child: Icon(Icons.people),
        ),
        title: Text(
          contact.name,
        ),
        subtitle: Text(contact.phone.toString()),
        trailing: GestureDetector(
          child: Icon(Icons.delete),
          onTap: () async {
            int result = await dbHelper.delete(contact);
            if (result > 0) {
              updateListView();
            }
          },
        ),
        onTap: () async {
          var contact2 = await navigateToEntryForm(context, contact);
          if (contact2 != null) {
            int result = await dbHelper.update(contact2);
            if (result > 0) {
              updateListView();
            }
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Data-Data'),
      ),
      body: FutureBuilder<List<ClassPenangkap>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
                children: snapshot.data.map((todo) => cardo(todo)).toList());
          } else {
            return SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Tambah Data',
        onPressed: () async {
          var contact = await navigateToEntryForm(context, null);
          if (contact != null) {
            int result = await dbHelper.insert(contact);
            if (result > 0) {
              updateListView();
            }
          }
        },
      ),
    );
  }
}
