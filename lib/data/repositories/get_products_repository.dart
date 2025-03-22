import 'dart:async';
import 'package:dio/dio.dart';
import 'package:effective_flutter_lab/data/models/product_data_model.dart';

class GetProductsRepository {
  final dio = Dio();

  Future<ProductDataModel> getProductsData() async {
    final response = await dio.get(
      'https://coffeeshop.academy.effective.band/api/v1/products?page=0&limit=50',
    );
    ProductDataModel model = ProductDataModel.fromJson(response.data);
    return model;
  }
}
