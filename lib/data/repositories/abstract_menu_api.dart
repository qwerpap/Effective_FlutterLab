import 'package:effective_flutter_lab/data/models/category_model.dart';
import 'package:effective_flutter_lab/data/models/product_model.dart';

abstract class AbstractMenuAPI {
  Future<List<CategoryModel>> getCategoriesList();
  Future<List<ProductModel>> getProductsByCategoryList(int id);
  Future<bool> postProductsList(List<ProductModel> products); 
}

