// chạy thử lần 1 chỉnh sau á ! 
class Product {
  int? idsp;
  String? tenSP;
  int? idThuongHieu; // đổi => tên thương hiệu
  int? idLoai; // đổi => tên loại sp
  int? idMau; // đổi => tên màu sắc 
  int? idTrangThai; // đổi/xóa => tên trạng thái
  int? idnv; // đổi/xóa => tên nhân viên

  Product(
      {this.idsp,
      this.tenSP,
      this.idThuongHieu,
      this.idLoai,
      this.idMau,
      this.idTrangThai,
      this.idnv});

  Product.fromJson(Map<String, dynamic> json) {
    idsp = json['idsp'];
    tenSP = json['tenSP'];
    idThuongHieu = json['idThuongHieu'];
    idLoai = json['idLoai'];
    idMau = json['idMau'];
    idTrangThai = json['idTrangThai'];
    idnv = json['idnv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idsp'] = this.idsp;
    data['tenSP'] = this.tenSP;
    data['idThuongHieu'] = this.idThuongHieu;
    data['idLoai'] = this.idLoai;
    data['idMau'] = this.idMau;
    data['idTrangThai'] = this.idTrangThai;
    data['idnv'] = this.idnv;
    return data;
  }
}
