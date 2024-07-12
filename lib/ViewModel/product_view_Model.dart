// ignore: file_names
import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/Model/Product.dart';
import 'package:mainpage_detailuser_v1/Services/ProductServices.dart';

class ProductViewModel extends ChangeNotifier {
  late List<Product> products = [];
  void fetchProductList() async {
    products = (await ProductServices.fetchProductList());
      // ignore: avoid_print
      print("product: $products");
    notifyListeners();
  }
}
