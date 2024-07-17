// ignore: file_names
// ignore_for_file: unnecessary_brace_in_string_interps, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/Model/Product.dart';
import 'package:mainpage_detailuser_v1/Model/Products/ProductCartItem.dart';
import 'package:mainpage_detailuser_v1/Services/ProductServices.dart';

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
}
