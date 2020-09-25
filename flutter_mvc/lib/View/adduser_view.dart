
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///F:/flutter/flutter_mvc/lib/Repository/dbHelper.dart';
import 'package:flutter_mvc/Model/user.dart';
import 'package:flutter_mvc/Model/utility.dart';
import 'package:flutter_mvc/View/userlist.dart';
import 'package:image_picker/image_picker.dart';


class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {

  var imageFile;
  DBHelper dbHelper;
  String imgString='';
  var nameController =TextEditingController();
  var phoneController =TextEditingController();
  var emailController =TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper= DBHelper();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add user'),
        actions: <Widget> [
          IconButton(
            icon: const Icon(Icons.view_list),
            tooltip: 'ViewList',
            onPressed: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserList() ));
            },
          )
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Expanded(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Name"
                  ),
                ),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Email"
                  ),
                ),
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "PhoneNumber",
                  ),
                ),
                Row(
                  children:<Widget> [
                    Container(
                      width: 200,
                      height: 200,
                      child: imageFile == null ? Center(child: Text('Chưa có hình'),) : Image.file(imageFile,fit: BoxFit.fill,)
                    ),
                    RaisedButton
                      (
                      child: Text('Choose picture'),
                      onPressed: pickImage,
                    )
                  ],
                ),
                RaisedButton
                  (
                  child: Text('Add'),
                  onPressed: onAddUser,
                )

              ],
            ),

          ),
        ),
      ),
    );
  }

  void onAddUser() {
    User user =new User(id: 0,name: nameController.text,email: emailController.text,image: imgString,phone: phoneController.text);
    dbHelper.addNewUser(user);
  }

  void pickImage()
  {
    ImagePicker.pickImage(source: ImageSource.gallery).then((imgFile) {
         setState(() {
           imageFile=imgFile;
           imgString =Utility.base64String(imgFile.readAsBytesSync());
         });
    });
  }
}
