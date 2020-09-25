class User{
  int id;
  String name,phone,email,image;
  User({this.id,this.name,this.phone,this.email,this.image});
  Map<String , dynamic> toMap()
  {
    var map = <String , dynamic>
    {
      'id': this.id,
      'name': this.name,
      'phone': this.phone,
      'email': this.email,
      'image':this.image,
    };
    return map;
  }
  User.fromMap(Map<String , dynamic> map)
  {
   name=map['name'];
   phone=map['phone'];
   email=map['email'];
   image=map['image'];
  }
}