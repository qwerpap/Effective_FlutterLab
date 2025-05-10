import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'products_database.g.dart';

class ProductsItems extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get imageUrl => text()();
  TextColumn get price => text()();
  IntColumn get categoryID => integer()();
}

@DriftDatabase(tables: [ProductsItems])
class ProductsDatabase extends _$ProductsDatabase {
  ProductsDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'productsdb.db'));
    return NativeDatabase(file);
  });
}
