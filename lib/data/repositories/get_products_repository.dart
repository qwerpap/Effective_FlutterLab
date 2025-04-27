import 'dart:async';
import 'package:dio/dio.dart';
import 'package:effective_flutter_lab/data/repositories/abstract_menu_api.dart';
import 'package:effective_flutter_lab/data/repositories/sources/categories_database.dart';
import 'package:effective_flutter_lab/data/repositories/sources/menu_categories_api.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

class GetProductsRepository implements AbstractMenuAPI {
  GetProductsRepository({required this.dio}) {
    menuCategoriesApi = MenuCategoriesAPI(dio: dio);
  }
  final Dio dio;

  late final MenuCategoriesAPI menuCategoriesApi;
  final menuCategoriesDB = MenuCategoriesDataBase();

  @override
  Future<List<CategoryModel>> getCategoriesList() async {
    List<CategoryModel> rawCategories = [];
    try {
      rawCategories = await menuCategoriesApi.getCategoriesList();
      menuCategoriesDB.saveCategoriesToDB(rawCategories);
    } catch (e) {
      rawCategories = await menuCategoriesDB.getCategoriesList();
      if (rawCategories.length == 0) return throw Exception('DB is not found');
    }
    return rawCategories;
  }

  @override
  Future<List<ProductModel>> getProductsByCategoryList(int id) async {
    List<ProductModel> productsByCategoryID = [];
    try {
      productsByCategoryID = await menuCategoriesApi.getProductsByCategoryList(
        id,
      );
      menuCategoriesDB.saveProductsToDB(productsByCategoryID, id);
    } catch (e) {
      productsByCategoryID = await menuCategoriesDB.getProductsByCategoryList(
        id,
      );
    }
    return productsByCategoryID;
  }

  @override
  Future<bool> postProductsList(List<ProductModel> products) async {
    bool postResult = await menuCategoriesApi.postProductsList(products);
    return postResult;
  }
}
