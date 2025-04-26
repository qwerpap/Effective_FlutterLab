import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:effective_flutter_lab/data/repositories/abstract_menu_api.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

class GetProductsRepository implements AbstractMenuAPI {
  GetProductsRepository({required this.dio});
  final Dio dio;

  @override
  Future<List<CategoryModel>> getCategoriesList() async {
    final Response<dynamic> categoriesResponse = await dio.get(
      'https://coffeeshop.academy.effective.band/api/v1/products/categories?page=0&limit=50',
    );
    final data = categoriesResponse.data;

    final List<CategoryModel> categories = List<CategoryModel>.from(
      (data['data'] as List<dynamic>).map(
        (value) => CategoryModel(
          id: int.parse(value['id'].toString()),
          slug: value['slug'],
        ),
      ),
    );
    return categories;
  }

  @override
  Future<List<ProductModel>> getProductsByCategoryList(int id) async {
    final Response<dynamic> productsResponse = await dio.get(
      'https://coffeeshop.academy.effective.band/api/v1/products?page=0&limit=50&category=$id',
    );
    final data = productsResponse.data;

    final List<ProductModel> products = List<ProductModel>.from(
      (data['data'] as List<dynamic>).map(
        (value) => ProductModel(
          id: int.parse(value['id'].toString()),
          name: value['name'],
          description: value['description'],
          imageUrl: value['imageUrl'],
          prices: double.parse(value['prices'][0]['value'].toString()),
        ),
      ),
    );
    return products;
  }

  Future<bool> postProductsList(List<ProductModel> products) async {
    Map<String, dynamic> requestBody = {"positions": {}, "token": 'token'};
    Map<int, int> productCountMap = {};

    for (var product in products) {
      if (productCountMap.containsKey(product.id)) {
        productCountMap[product.id] = (productCountMap[product.id] ?? 0) + 1;
      } else {
        productCountMap[product.id] = 1;
      }
    }

    for (var entry in productCountMap.entries) {
      requestBody['positions'][entry.key.toString()] = entry.value;
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
    } catch (e) {
      return false;
    }
  }
}
