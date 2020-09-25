import 'package:flutter/material.dart';
import 'file:///F:/flutter/flutter_mvc/lib/Repository/dbHelper.dart';
import 'package:flutter_mvc/Model/user.dart';
import 'package:flutter_mvc/Model/utility.dart';

class UserList extends StatelessWidget {
  Future<List<User>> items()async
  {
    var dbHelper = DBHelper();
    return dbHelper.getAllUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<List<User>>(
          future: items(),
          builder: (context,snapshot){
            if(snapshot.data != null)
              {
                if(snapshot.hasData)
                  {
                    return ListView.builder(itemCount: snapshot.data.length,itemBuilder: (context,index){
                      return Row(
                        children:<Widget> [
                          Text(snapshot.data[index].name),
                          Text('\n'+snapshot.data[index].phone),
                          Text('\n'+snapshot.data[index].email),

                        ],
                      );
                    });
                  }
              }
            return new Container(
                alignment: AlignmentDirectional.center,
                child: new CircularProgressIndicator(),);
          },
        ),
      )
    );
  }
}
