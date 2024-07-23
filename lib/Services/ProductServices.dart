// // ignore_for_file: avoid_print
import 'dart:convert';
import 'package:dio/dio.dart';
//import 'package:mainpage_detailuser_v1/Model/Product.dart';
import 'package:mainpage_detailuser_v1/Model/ProductCartItem.dart';
import 'package:mainpage_detailuser_v1/Services/API/api_Url.dart';
// import 'dart:convert';

class ProductServices {
  static Future<List<ProductCart>> fetchProductCardList() async {
    try {
      final Dio dio = Dio();


      String username = '11186293';
      String password = '60-dayfreetrial';
      String basicAuth = 'Basic ${base64.encode(utf8.encode('$username:$password'))}';


      Options options = Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': basicAuth,
        },
      );

var response = await dio.get(ApiUrls.GET_ProductCartItem,
          options: options
          );
//
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

class ApiUrls {
  // local:

  static const String GET_Product = 'http://localhost:60056/api/ProductAPI';
  static const String GET_ProductImage =
      'http://localhost:60056/api/ImageProductAPI/';

  // local Services:

  //static const String GET_ProductCartItem_Localhost = 'http://localhost:60056/api/ProductServices';

  // hosting:

  static const String GET_ProductCartItem =
      'http://thienthetv-001-site1.ltempurl.com/api/ProductServices';
  // static const String GET_ProductCartItem = 'http://backendflutter2024.somee.com/api/ProductServices';
}