import 'package:flutter/material.dart';
import 'package:flutter_mvc/Controller/sanpham_controller.dart';
import 'package:flutter_mvc/Model/SanPham.dart';

class SanPhamView extends StatefulWidget {
  @override
  _SanPhamViewState createState() => _SanPhamViewState();
}

class _SanPhamViewState extends State<SanPhamView> {
  SanPhamController sanPhamController = SanPhamController();

  var ten_Controller = TextEditingController();
  var mota_Controller = TextEditingController();
  var gia_Controller = TextEditingController();
  var soluong_Controller = TextEditingController();
  var maloai_Controller = TextEditingController();
  var hinh_Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mỹ phẩm'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              return showDialog(context: context,builder: (_)=> new AlertDialog(
                content: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            autofocus: true,
                            decoration: InputDecoration(hintText: 'Tên sản phẩm'),
                            controller: ten_Controller,
                          ),
                          TextFormField(
                            autofocus: false,
                            decoration: InputDecoration(hintText: 'Mô tả'),
                            controller:mota_Controller,

                          ),
                          TextFormField(
                            autofocus: false,
                            decoration: InputDecoration(hintText: 'Giá sản phẩm'),
                            controller:gia_Controller,

                          ),
                          TextFormField(
                            autofocus: false,
                            decoration: InputDecoration(hintText: 'Mã loại'),
                            controller:maloai_Controller,

                          ),
                          TextFormField(
                            autofocus: false,
                            decoration: InputDecoration(hintText: 'Số lượng'),
                            controller:soluong_Controller,
                          ),

                          TextFormField(
                            autofocus: false,
                            decoration: InputDecoration(hintText: 'Link hình ảnh'),
                            controller:hinh_Controller,
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
                    },
                    child: Text('Hủy'),

                  ),
                  FlatButton(
                    onPressed: ()
                    {
                      setState(() {
                        sanPhamController.themSanPhamFromDB(
                            ten_Controller.text, mota_Controller.text, gia_Controller.text, maloai_Controller.text, soluong_Controller.text, hinh_Controller.text);
                      });

                    },
                    child: Text('Thêm sản phẩm'),

                  ),
                ],
              ),
              );
            },
          )
        ],
      ),
      body: Container(

        child: FutureBuilder<List<SanPham>>(
          future: sanPhamController.getALLSanPhamFromDB(),
          builder: (context,snapshot){
            if(snapshot.data != null )
              {
               if(snapshot.hasData)
                 {
                   return ListView.builder(itemBuilder: (context,index){
                        return Container(
                          decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 8),borderRadius: BorderRadius.circular(20) ),
                          width: double.infinity,
                          height: 400,
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children:<Widget> [
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(snapshot.data[index].tenSP),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all( 8.0),
                                      child: Text(snapshot.data[index].soluong.toString()),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all( 8.0),
                                      child: Text(snapshot.data[index].moTa.toString()),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all( 8.0),
                                      child: Text(snapshot.data[index].giaSP.toString()),

                                    ),
                                    Container(
                                      width: 200,
                                      height: 200,
                                      padding: EdgeInsets.all( 8.0),
                                      child: Image.network(snapshot.data[index].hinhAnh,fit: BoxFit.fill,),
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
                                                decoration: InputDecoration(hintText: 'Tên sản phẩm'),
                                                controller: ten_Controller,
                                              ),
                                              TextFormField(
                                                autofocus: false,
                                                decoration: InputDecoration(hintText: 'Mô tả'),
                                                controller:mota_Controller,

                                              ),
                                              TextFormField(
                                                autofocus: false,
                                                decoration: InputDecoration(hintText: 'Giá sản phẩm'),
                                                controller:gia_Controller,

                                              ),
                                              TextFormField(
                                                autofocus: false,
                                                decoration: InputDecoration(hintText: 'Mã loại'),
                                                controller:maloai_Controller,

                                              ),
                                              TextFormField(
                                                autofocus: false,
                                                decoration: InputDecoration(hintText: 'Số lượng'),
                                                controller:soluong_Controller,
                                              ),

                                              TextFormField(
                                                autofocus: false,
                                                decoration: InputDecoration(hintText: 'Link hình ảnh'),
                                                controller:hinh_Controller,
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
                                        },
                                        child: Text('Cancel'),

                                      ),
                                      FlatButton(
                                        onPressed: ()
                                        {
                                            setState(() {
                                              Navigator.pop(context);
                                              sanPhamController.SuaSanPhamFromDB(snapshot.data[index].maSP, ten_Controller.text, mota_Controller.text, gia_Controller.text, maloai_Controller.text, soluong_Controller.text, hinh_Controller.text);
                                              sanPhamController.getALLSanPhamFromDB();
                                            });
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
                                      setState(() {
                                        sanPhamController.XoaSanPhamFromDB(int.parse(snapshot.data[index].maSP));
                                        sanPhamController.getALLSanPhamFromDB();
                                      });
                                },
                                child: Icon(
                                    Icons.delete
                                ),
                              )
                            ],
                          ),
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


      )
    );
  }
}
