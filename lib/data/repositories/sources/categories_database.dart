// import 'dart:developer' as developer;
// import 'package:drift/drift.dart';
// import 'package:effective_flutter_lab/data/models/category_model.dart';
// import 'package:effective_flutter_lab/data/models/product_model.dart';
// import 'package:effective_flutter_lab/data/repositories/abstract_menu_api.dart';
// import 'package:effective_flutter_lab/database/categories_database.dart';
// import 'package:effective_flutter_lab/database/products_database.dart';
// import 'package:get_it/get_it.dart';

// class MenuCategoriesDataBase implements AbstractMenuAPI {
//   final CategoriesDatabase CategoriesDB = GetIt.I<CategoriesDatabase>();
//   final ProductsDatabase ProductsDB = GetIt.I<ProductsDatabase>();

//   void saveCategoriesToDB(List<CategoryModel> slugs) async {
//     await CategoriesDB.delete(CategoriesDB.categoriesItems).go();
//     slugs.forEach((slug) async {
//       developer.log('saving Category', name: 'DB');
//       //await CategoriesDB.update(CategoriesDB.categoriesItems).write(
//       await CategoriesDB.into(CategoriesDB.categoriesItems).insert(
//         CategoriesItemsCompanion.insert(
//           id: Value(slug.id),
//           slug: slug.slug,
//         ),
//       );
//       developer.log('Category saved', name: 'DB');
//     });
//   }

//   void saveProductsToDB(List<ProductModel> cards, int categoryID) async {
//     await (ProductsDB.delete(ProductsDB.productsItems)
//       ..where((t) => t.categoryID.equals(categoryID))).go();
//     cards.forEach((product) async {
//       developer.log('saving Product', name: 'DB');
//       await ProductsDB.into(ProductsDB.productsItems).insert(
//         ProductsItemsCompanion.insert(
//           id: product.id,
//           imageUrl: product.imageUrl,
//           name: product.name,
//           description: product.description,
//           priceType: product.prices.toString(),
//           categoryID: categoryID,
//         ),
//       );
//       developer.log('Product saved', name: 'DB');
//     });
//   }

//   @override
//   Future<List<CategoryModel>> getCategoriesList() async {
//     developer.log('start getTags', name: 'DB');

//     List<CategoriesItem> dbCategories =
//         await CategoriesDB.select(CategoriesDB.categoriesItems).get();

//     List<CategoryModel> rawCategories =
//         dbCategories.map((category) {
//           return CategoryModel(id: category.id, slug: category.slug);
//         }).toList();
//     developer.log('return', name: 'DB');
//     return rawCategories;
//   }

//   @override
//   Future<List<ProductModel>> getProductsByCategoryList(int id) async {
//     developer.log('start get ProductsByCategory', name: 'DB');
//     List<ProductsItem> dbProducts =
//         await (ProductsDB.select(ProductsDB.productsItems)
//           ..where((p) => p.categoryID.equals(id))).get();

//     List<ProductModel> productsByCategoryID =
//         dbProducts.map((product) {
//           return ProductModel(
//             id: product.id,
//             imageUrl: product.imageUrl,
//             name: product.name,
//             description: product.description,
//             prices: double.parse(product.priceType.toString()),
//           );
//         }).toList();

//     return productsByCategoryID;
//   }

//   @override
//   Future<bool> postProductsList(List<ProductModel> cards) async {
//     developer.log('Post Start', name: 'DB');
//     return false;
//   }
// }
