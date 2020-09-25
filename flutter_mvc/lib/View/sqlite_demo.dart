import 'package:flutter/material.dart';
import 'package:flutter_mvc/Controller/contact_controller.dart';
import 'package:flutter_mvc/View/contactlist.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {

  ContactController contactController = ContactController();
  String name , phone ;

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey= new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:  scaffoldKey,
      appBar: AppBar(
        title: Text('Hello'),
        actions: <Widget> [
          IconButton(
            icon: const Icon(Icons.view_list),
            tooltip: 'ViewList',
            onPressed: (){
              startContactList();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key:formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Name'
                ),
                validator: (val) => val.length == 0 ? "Enter your name": null,
                onSaved: (val) => this.name=val,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'Phone '
                ),
                validator: (val) => val.length == 0 ? "Enter your phone": null,
                onSaved: (val) => this.phone=val,
              ),
              Container(
                child: RaisedButton(
                  onPressed: submitContact,child: Text('Add new contact'),
                ),
              )
            ],
          ),
        ),
      ),
    );

  }

  void submitContact() {
    if(this.formKey.currentState.validate())
      {
        formKey.currentState.save();
      }
    else
      {
        return null;
      }
    contactController.InsertContact(name,phone);
    Fluttertoast.showToast(msg: "Contact is saved",toastLength: Toast.LENGTH_SHORT);

  }


  void startContactList() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyContactList()));
  }
}

