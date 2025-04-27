import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:effective_flutter_lab/data/models/category_model.dart';
import 'package:effective_flutter_lab/data/models/product_model.dart';
import 'package:effective_flutter_lab/data/repositories/abstract_menu_api.dart';

class MenuCategoriesAPI implements AbstractMenuAPI {
  MenuCategoriesAPI({required this.dio});
  final Dio dio;

  @override
  Future<List<CategoryModel>> getCategoriesList() async {
    Response<dynamic> categoriesResponse;
    List<CategoryModel> rawCategories = [];
    try {
      categoriesResponse = await dio.get(
        'https://coffeeshop.academy.effective.band/api/v1/products/categories?page=0&limit=50',
      );
      final data = categoriesResponse.data;
      rawCategories = List<CategoryModel>.from(
        (data['data'] as List<dynamic>).map(
          (value) => CategoryModel(
            id: int.parse(value['id'].toString()),
            slug: value['slug'].toString(),
          ),
        ),
      );
      return rawCategories;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<List<ProductModel>> getProductsByCategoryList(int id) async {
    Response<dynamic> productsResponse;
    List<ProductModel> productsByCategoryID = [];
    try {
      productsResponse = await dio.get(
        'https://coffeeshop.academy.effective.band/api/v1/products?page=0&limit=50&category=$id',
      );
      var data = productsResponse.data;
      productsByCategoryID = List<ProductModel>.from(
        (data['data'] as List<dynamic>).map(
          (value) => ProductModel(
            id: int.parse(value['id'].toString()),
            imageUrl: value['imageUrl'].toString(),
            name: value['name'].toString(),
            prices: double.parse(value['prices'][0]['value'].toString()),
            description: value['description'],
          ),
        ),
      );
      return productsByCategoryID;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<bool> postProductsList(List<ProductModel> products) async {
    Map<String, dynamic> requestBody = {'positions': {}, 'token': ''};

    Map<String, int> productCountMap = {};
    for (var product in products) {
      if (productCountMap.containsKey(product.id)) {
        productCountMap[product.id.toString()] =
            (productCountMap[product.id] ?? 0) + 1;
      } else {
        productCountMap[product.id.toString()] = 1;
      }
    }

    for (var entry in productCountMap.entries) {
      requestBody['positions'][entry.key] = entry.value;
    }
    try {
      Response response = await dio.post(
        'https://coffeeshop.academy.effective.band/api/v1/orders/',
        data: jsonEncode(requestBody),
        options: Options(contentType: 'application/json'),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }
}
