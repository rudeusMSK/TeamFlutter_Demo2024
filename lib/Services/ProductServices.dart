// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:mainpage_detailuser_v1/Model/Product.dart';
import 'package:mainpage_detailuser_v1/Model/Products/ProductCartItem.dart';
import 'package:mainpage_detailuser_v1/Services/API/api_Url.dart';

class ProductServices {
  // Product:
  static Future<List<Product>> fetchProductList() async {
    try {
      final Dio dio = Dio();
      // End Point:
      Response response = await dio.get(ApiUrls.GET_Product);

      // Product product = Product.fromJson(response.data);

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<Product> productList =
            data.map((item) => Product.fromJson(item)).toList();
        return productList;
      } else {
        throw Exception('Failed to load products -⁠﹏⁠-');
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return [];
    }
  }

//
  static Future<List<ProductCart>> fetchProductCardList() async {
  try {
    final Dio dio = Dio();
    // End Point:
    Response response = await dio.get(ApiUrls.GET_ProductCartItem);
    // Product product = Product.fromJson(response.data);
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      List<ProductCart> productList =
          data.map((item) => ProductCart.fromJson(item)).toList();
      return productList;
    } else {
      throw Exception('Failed to load products card item -⁠﹏⁠-');
    }
  } catch (e) {
    print(e);
    return [];
  }
}
}
