// ignore: file_names
import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/Model/Product.dart';
import 'package:mainpage_detailuser_v1/Model/Products/ProductCartItem.dart';
import 'package:mainpage_detailuser_v1/Services/ProductServices.dart';

class ProductViewModel extends ChangeNotifier {
  late List<Product> products = [];
  late List<ProductCart> productCards = [];
  void fetchProductList() async {
    products = (await ProductServices.fetchProductList());
    // ignore: avoid_print
    print("product: $products");
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  void fetch_Product_Card_List() async {
    productCards = (await ProductServices.fetchProductCardList());
    // ignore: avoid_print
    print("product cart: ${productCards}");
    notifyListeners();
  }
}
