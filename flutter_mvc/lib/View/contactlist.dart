import 'package:flutter/material.dart';
import 'file:///F:/flutter/flutter_mvc/lib/Repository/dbHelper.dart';
import 'package:flutter_mvc/Controller/contact_controller.dart';
import 'package:flutter_mvc/Model/contact.dart';



class MyContactList extends StatefulWidget {

  @override
  _MyContactListState createState() => _MyContactListState();
}

class _MyContactListState extends State<MyContactList> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  final name_controller = new TextEditingController();
  final phone_controller = new TextEditingController();
  ContactController contactController = ContactController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: FutureBuilder<List<Contact>>(
            future: contactController.getContactFromDB(),
            builder: (context,snapshot)
            {
              if(snapshot.data != null)
                {
                  if(snapshot.hasData)
                    {
                      return ListView.builder(itemCount: snapshot.data.length,itemBuilder: (context,index){
                        return Row(
                          children: <Widget> [
                            Expanded(
                              child: Column(
                                children:<Widget> [
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(snapshot.data[index].name),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all( 8.0),
                                    child: Text(snapshot.data[index].phone),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                showDialog(context: context,builder: (_) => new AlertDialog(
                                contentPadding: EdgeInsets.all(16.0),
                                  content: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          children: <Widget>[
                                            TextFormField(
                                              autofocus: true,
                                              decoration: InputDecoration(hintText: '${snapshot.data[index].name}'),
                                              controller: name_controller,
                                            ),
                                            TextFormField(
                                              autofocus: false,
                                              decoration: InputDecoration(hintText: '${snapshot.data[index].phone}'),
                                              controller:phone_controller,

                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: ()
                                      {
                                          Navigator.pop(context);
                                          name_controller.text='';
                                          phone_controller.text='';
                                      },
                                      child: Text('Cancel'),

                                    ),
                                    FlatButton(
                                      onPressed: ()
                                      {
                                        contactController.UpdateContact(snapshot.data[index].id,snapshot.data[index].name,snapshot.data[index].phone,name_controller,phone_controller);
                                          setState(() {
                                            Navigator.pop(context);
                                            contactController.getContactFromDB();
                                          });

                                        name_controller.text='';
                                        phone_controller.text='';
                                      },
                                      child: Text('Update'),

                                    ),
                                  ],
                                ));
                              },
                              child: Icon(
                                Icons.update
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                contactController.DeleteContact(snapshot.data[index]);
                                  setState(() {
                                    contactController.getContactFromDB();
                                  });
                              },
                              child: Icon(
                                  Icons.delete
                              ),
                            )

                          ],
                        );
                      });
                    }
                }
              return new Container(
                alignment: AlignmentDirectional.center,
                child: new CircularProgressIndicator(),
              );

            },
          ),
      ),
    );
  }


}



