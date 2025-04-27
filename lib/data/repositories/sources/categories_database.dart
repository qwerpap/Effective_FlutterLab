import 'dart:developer' as developer;
import 'package:drift/drift.dart';
import 'package:effective_flutter_lab/data/models/category_model.dart';
import 'package:effective_flutter_lab/data/models/product_model.dart';
import 'package:effective_flutter_lab/data/repositories/abstract_menu_api.dart';
import 'package:effective_flutter_lab/database/categories_database.dart';
import 'package:effective_flutter_lab/database/products_database.dart';
import 'package:get_it/get_it.dart';

class MenuCategoriesDataBase implements AbstractMenuAPI {
  final CategoriesDatabase categoriesDB = GetIt.I<CategoriesDatabase>();
  final ProductsDatabase productsDB = GetIt.I<ProductsDatabase>();

  Future<void> saveCategoriesToDB(List<CategoryModel> slugs) async {
    await categoriesDB.delete(categoriesDB.categoriesItems).go();
    for (final slug in slugs) {
      await categoriesDB
          .into(categoriesDB.categoriesItems)
          .insert(
            CategoriesItemsCompanion.insert(
              id: Value(slug.id),
              slug: slug.slug,
            ),
          );
      developer.log('category saved', name: 'DB');
    }
  }

  Future<void> saveProductsToDB(
    List<ProductModel> products,
    int categoryID,
  ) async {
    await (productsDB.delete(productsDB.productsItems)
      ..where((t) => t.categoryID.equals(categoryID))).go();

    for (final product in products) {
      developer.log('saving product', name: 'DB');
      await productsDB
          .into(productsDB.productsItems)
          .insert(
            ProductsItemsCompanion.insert(
              id: product.id,
              imageUrl: product.imageUrl,
              name: product.name,
              description: product.description,
              price: product.prices.toString(),
              categoryID: categoryID,
            ),
          );
      developer.log('Product saved', name: 'DB');
    }
  }

  @override
  Future<List<CategoryModel>> getCategoriesList() async {
    List<CategoriesItem> dbCategories =
        await categoriesDB.select(categoriesDB.categoriesItems).get();

    List<CategoryModel> rawCategories =
        dbCategories.map((category) {
          return CategoryModel(id: category.id, slug: category.slug);
        }).toList();
    return rawCategories;
  }

  @override
  Future<List<ProductModel>> getProductsByCategoryList(int id) async {
    developer.log('start getProductsByCategoryList');
    List<ProductsItem> dbProducts =
        await (productsDB.select(productsDB.productsItems)
          ..where((p) => p.categoryID.equals(id))).get();

    List<ProductModel> productsByCategoryID =
        dbProducts.map((product) {
          return ProductModel(
            id: product.id,
            imageUrl: product.imageUrl,
            name: product.name,
            description: product.description,
            prices: double.parse(product.price.toString()),
          );
        }).toList();

    return productsByCategoryID;
  }

  @override
  Future<bool> postProductsList(List<ProductModel> cards) async {
    developer.log('post start', name: 'DB');
    return false;
  }
}
