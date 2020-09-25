class SanPham
{
  String maSP,giaSP,soluong,maLoai;
  String tenSP,hinhAnh,moTa;

  SanPham({this.maSP,this.tenSP,this.giaSP,this.hinhAnh,this.moTa,this.soluong,this.maLoai});

  Map<String , dynamic> toJSon()
  {
    var map = <String , dynamic>
    {
      'masp':maSP,
      'tensp':tenSP,
      'hinh':hinhAnh,
      'mota':moTa,
      'gia': giaSP,
      'MaLoaiSanPham': maLoai,
      'soluong': soluong,
    };
    return map;
  }
  SanPham.fromJSon(Map<String , dynamic> map)
  {
      maSP=map['masp'] as String;
      tenSP=map['tensp']as String ;
      hinhAnh=map['hinh']as String;
      moTa=map['mota']as String;
      giaSP=map['gia']as String;
      maLoai=map['MaLoaiSanPham']as String;
      soluong=map['soluong']as String;
  }
}