import 'package:flutter_mvc/Model/SanPham.dart';
import 'package:flutter_mvc/Repository/sanpham_respository.dart';

import 'package:mvc_pattern/mvc_pattern.dart';

class SanPhamController extends ControllerMVC
{
  static SanPhamController _this;
  SanPhamController._();
  factory SanPhamController()
  {
    if(_this == null)_this=SanPhamController._();
    return _this;
  }

  Future<List<SanPham>> getALLSanPhamFromDB()async
  {
    SanPhamRepository sanphamRepository = SanPhamRepository();
        return sanphamRepository.getAllSanPham();
  }

  Future themSanPhamFromDB(String tensp,String mota,String giasanpham,String maloai,String soluong,String hinh)async
  {
    SanPhamRepository sanphamRepository = SanPhamRepository();
    sanphamRepository.themSanPham(tensp, mota, giasanpham, maloai, soluong, hinh);
  }

  Future XoaSanPhamFromDB(int id)async
  {
    SanPhamRepository sanphamRepository = SanPhamRepository();
    sanphamRepository.xoaSanPham(id);
  }
  Future SuaSanPhamFromDB(String id,String tensp,String mota,String giasanpham,String maloai,String soluong,String hinh)async
  {
    SanPhamRepository sanphamRepository = SanPhamRepository();
    sanphamRepository.capNhatSanPham(id,tensp, mota, giasanpham, maloai, soluong, hinh);
  }
}