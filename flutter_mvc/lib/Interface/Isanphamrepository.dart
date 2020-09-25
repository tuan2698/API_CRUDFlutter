import 'package:flutter_mvc/Model/SanPham.dart';

abstract class ISanPhamRepository
{
  Future<List<SanPham>> getAllSanPham();
}