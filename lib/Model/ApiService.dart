import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Product.dart';


class ApiService{
  final String baseUrl = "http://10.0.2.2:5125";

  Future<List<Product>> getProduct() async {
    final response = await http.get(Uri.parse('$baseUrl/api/Products'));

    if (response.statusCode == 200) {
      final products = (jsonDecode(response.body) as List)
          .map((e) => Product.fromJson(e))
          .toList();
      return products;
      // Xử lý dữ liệu JSON ở đây
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<Product>> getProductId(String id) async {
    id = "6697fea140718aacc83f23f7";
    final response = await http.get(Uri.parse('$baseUrl/api/Products/$id'));

    if (response.statusCode == 200) {
      final products = (jsonDecode(response.body) as List)
          .map((e) => Product.fromJson(e))
          .toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}