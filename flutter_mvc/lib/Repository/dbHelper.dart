import 'dart:async';

import 'package:flutter_mvc/Model/contact.dart';
import 'package:flutter_mvc/Model/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io'as io;
class DBHelper
{
  final String TABLE_NAME = "Contact";
  final String TABLE_NAMEUSER = "User";
  static Database db_instance;
  Future<Database> get db async
  {
    if(db_instance == null)
      {
        db_instance= await innitDB();
      }
    return db_instance;
  }

  innitDB() async {
    io.Directory documenDirectory = await getApplicationDocumentsDirectory();
    String path = join(documenDirectory.path, "Demo.db");
    var db = await openDatabase(path, version: 1, onCreate: onCreateFunc);
    return db;
  }
  void onCreateFunc(Database db, int version) async{
    //create table
    await db.execute('CREATE TABLE $TABLE_NAMEUSER(id INTEGER,name TEXT,email TEXT,phone TEXT,image TEXT)');
    await db.execute('CREATE TABLE $TABLE_NAME(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,phone TEXT);');

  }

  //get contact
  Future<List<Contact>>getContacts()async {
      var db_connection = await db;

     List<Map> list = await db_connection.rawQuery("SELECT * FROM $TABLE_NAME");
     List<Contact> contacts = new List();

     for(int i = 0 ; i < list.length ; i++)
       {
         Contact contact = new Contact();
         contact.id= list[i]['id'];
          contact.name= list[i]['name'];
          contact.phone = list[i]['phone'];
          contacts.add(contact);
       }
      return contacts;
  }

  //add new contact
  void addNewContact(Contact contact)async
  {
    var db_connection = await db;
    String query = 'INSERT INTO $TABLE_NAME(name,phone) VALUES(\'${contact.name}\',\'${contact.phone}\')';
    await db_connection.transaction((transaction) async{
      return await transaction.rawInsert(query);
    });

  }

  //update contact
  void updateContact(Contact contact)async
  {
    var db_connection = await db;
    String query = 'UPDATE $TABLE_NAME SET name= \'${contact.name}\',phone= \'${contact.phone}\' WHERE id = ${contact.id}';
    await db_connection.transaction((transaction) async{
      return await transaction.rawQuery(query);
    });

  }

  //delete contact
  void deleteContact(Contact contact)async
  {
    var db_connection = await db;
    String query = 'DELETE FROM $TABLE_NAME  WHERE id = ${contact.id}';
    await db_connection.transaction((transaction) async{
      return await transaction.rawQuery(query);
    });

  }

  //insert user
    Future<User> addNewUser(User user) async
    {
      var db_connetion = await db;
      user.id = await db_connetion.insert(TABLE_NAMEUSER, user.toMap());
      return user;
    }
  // void addNewUser(User user) async
  // {
  //   var db_connetion = await db;
  //   String query = 'INSERT INTO $TABLE_NAME(name,phone) VALUES(\'${contact.name}\',\'${contact.phone}\')';
  //   await db_connection.transaction((transaction) async{
  //     return await transaction.rawInsert(query);
  //   });
  // }
    // get users
    Future<List<User>> getAllUser()async
    {
      var db_connetion = await db;
      List<Map> maps = await db_connetion.query(TABLE_NAMEUSER,columns: ['id','name','email','phone','email']);
      List<User> users = [];
      if(maps.length > 0)
        {
          for(int i = 0 ; i < maps.length ; i ++ )
            {
              users.add(User.fromMap(maps[i]));
            }
        }
      return users;
    }
    Future close()async
    {
      var db_con=await db;
      db_con.close();
    }
}

