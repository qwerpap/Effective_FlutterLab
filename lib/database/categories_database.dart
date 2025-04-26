import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'categories_database.g.dart'; 

class CategoriesItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get slug => text()();
}

@DriftDatabase(tables: [CategoriesItems])
class CategoriesDatabase extends _$CategoriesDatabase {
  CategoriesDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'categoriesdb.db'));
    return NativeDatabase(file);
  });
}
