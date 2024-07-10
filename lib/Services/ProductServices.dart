import 'package:dio/dio.dart';
import 'package:mainpage_detailuser_v1/Model/Product.dart';
import 'package:mainpage_detailuser_v1/Services/API/api_Url.dart';

class ProductServices {
  static Future<List<Product>> fetchProductList() async {
    try {
      final Dio dio = Dio();
      // End Point:
      Response response = await dio.get(ApiUrls.GET_Product);

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<Product> productList =
            data.map((item) => Product.fromJson(item)).toList();
        return productList;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
