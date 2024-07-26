class Product {
  final String? id;
  final String? name;
  final String? description;
  final String? price;
  final List<String>? img;
  final String? size;
  final String? loaisp;
  

  Product({required this.id, required this.name, required this.description, required this.price, required this.img, required this.size, required this.loaisp});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      name: json["name"],
      description: json["des"],
      price: json["price"],
      img: List<String>.from(json["img"] ?? []),
      size: json["size"],
      loaisp: json["loaisp"],
    );
  }

  
}
