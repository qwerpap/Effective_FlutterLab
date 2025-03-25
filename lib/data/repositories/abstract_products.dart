import 'package:effective_flutter_lab/data/models/category_model.dart';
import 'package:effective_flutter_lab/data/models/product_model.dart';

abstract class AbstractMenuCategoriesAPI {
  Future<List<CategoryModel>> getCategoriesTagsList();
  Future<List<ProductModel>> getProductsByCategoryList(int id);
  // Future<bool> postProductsList(List<ProductModel> cards); // по идеи для post заапроса в будущем
}
