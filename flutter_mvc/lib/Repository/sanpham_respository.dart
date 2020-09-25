
import 'dart:convert';

import 'package:flutter_mvc/APIs/Links.dart';
import 'package:flutter_mvc/Interface/Isanphamrepository.dart';
import 'package:flutter_mvc/Model/SanPham.dart';
import 'package:http/http.dart' as http;
class SanPhamRepository implements ISanPhamRepository
{
  @override
  Future<List<SanPham>> getAllSanPham() async{
      try{
        List<SanPham> sanphams= List();
        final responces =await http.get(Links.GETALLSANPHAM_URL);
        if(responces.statusCode == 200)
          {
            var decodeJson= jsonDecode(responces.body);
            decodeJson.forEach((sanpham) => sanphams.add(SanPham.fromJSon(sanpham)));
            return sanphams;
          }
        else
          {
            return null;
          }
      }
      catch(exception)
    {
          return null;
    }
  }

  Future themSanPham(String tensp,String mota,String giasanpham,String maloai,String soluong,String hinh) async{
    final responce = await http.post( Links.THEMSANPHAM_URL,body: jsonEncode(<String,dynamic>{
        'tensp': tensp,
        'mota':  mota,
      'gia':giasanpham,
      'MaLoaiSanPham':maloai,
      'hinh':hinh,
      'soluong':soluong
    }));

    if(responce.statusCode == 200)
    {
      var s= responce.body;
      print(s);
    }
  }

  Future xoaSanPham(int id)async
  {
    final responce = await http.post( Links.XOASANPHAM_URL,body: jsonEncode(<String,dynamic>{
      'id':id,
    }));

    if(responce.statusCode == 200)
    {
      var s= responce.body;
      print(s);
    }
  }
  Future capNhatSanPham(String id,String tensp,String mota,String giasanpham,String maloai,String soluong,String hinh)async
  {
    final responce = await http.post( Links.SUASANPHAM_URL,body: jsonEncode(<String,dynamic>{
      'id':id,
      'tensp': tensp,
      'mota':  mota,
      'gia':giasanpham,
      'MaLoaiSanPham':maloai,
      'hinh':hinh,
      'soluong':soluong
    }));

    if(responce.statusCode == 200)
    {
      var s= responce.body;
      print(s);
    }
  }

}