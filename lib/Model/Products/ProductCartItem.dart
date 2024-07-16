// ignore: file_names
class ProductCart {
  int? idsp;
  String? tenSP;
  String? imgUrl;
  int? giaBan;

  ProductCart({this.idsp, this.tenSP, this.imgUrl, this.giaBan});

  ProductCart.fromJson(Map<String, dynamic> json) {
    idsp = json['idsp'];
    tenSP = json['tenSP'];
    imgUrl = json['img_Url'];
    giaBan = json['giaBan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idsp'] = this.idsp;
    data['tenSP'] = this.tenSP;
    data['img_Url'] = this.imgUrl;
    data['giaBan'] = this.giaBan;
    return data;
  }
}
