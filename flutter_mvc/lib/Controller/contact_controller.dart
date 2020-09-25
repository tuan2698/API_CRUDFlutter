import 'package:flutter/cupertino.dart';
import 'package:flutter_mvc/Model/contact.dart';
import 'package:flutter_mvc/Repository/dbHelper.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class ContactController extends ControllerMVC
{

  static ContactController _this;

  ContactController._();
  factory ContactController()
  {
    if(_this == null)_this=ContactController._();
    return _this;
  }
   Future<List<Contact>> getContactFromDB
      () async{
    var dbHelper = DBHelper();
    Future<List<Contact>> contacts= dbHelper.getContacts();
    return contacts;
  }

  void InsertContact(String name , String phone)async
  {
    Contact contact = new Contact();
    contact.name=name;
    contact.phone=phone;
     DBHelper dbHelper =  DBHelper();
     dbHelper.addNewContact(contact);
  }

  void UpdateContact(int id,String name , String phone,TextEditingController namecontroller , TextEditingController phonecontroller)async
  {
    Contact contact = new Contact();
    contact.id=id;
    contact.name= namecontroller != null ? namecontroller.text : name;
    contact.phone=phonecontroller != null ? phonecontroller.text : phone;
    DBHelper dbHelper =  DBHelper();
    dbHelper.updateContact(contact);


  }

  void DeleteContact(Contact contact)async
  {
    DBHelper dbHelper =  DBHelper();
    dbHelper.deleteContact(contact);

  }
}
