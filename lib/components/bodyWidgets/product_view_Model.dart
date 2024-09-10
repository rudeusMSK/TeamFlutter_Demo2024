// ignore: file_names
// ignore_for_file: unnecessary_brace_in_string_interps, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/Model/Product.dart';
import 'package:mainpage_detailuser_v1/Model/ProductCartItem.dart';
import 'package:mainpage_detailuser_v1/Services/ProductServices.dart';
import 'package:http/http.dart' as http;

class ProductViewModel extends ChangeNotifier {
  late List<Product> products = [];
  late List<ProductCart> productCards = []; 

  // => id mất nết quá trả thẳng về dữ liệu luôn cho nhẹ :3
  // void fetchProductList() async {
  //   products = (await ProductServices.fetchProductList());
  //   // ignore: avoid_print
  //   print("product: $products");
  //   notifyListeners();
  // }


  void fetch_Product_Card_List() async {
    productCards = (await ProductServices.fetchProductCardList());
    print("product cart: ${productCards}");
    notifyListeners();
  }

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:5125/api/Products'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      products = jsonResponse.map((product) => Product.fromJson(product)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load products');
    }
  }
  
}