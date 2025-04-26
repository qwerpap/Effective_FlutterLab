// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_database.dart';

// ignore_for_file: type=lint
class $ProductsItemsTable extends ProductsItems
    with TableInfo<$ProductsItemsTable, ProductsItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<String> price = GeneratedColumn<String>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIDMeta = const VerificationMeta(
    'categoryID',
  );
  @override
  late final GeneratedColumn<int> categoryID = GeneratedColumn<int>(
    'category_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    imageUrl,
    price,
    categoryID,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductsItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('category_i_d')) {
      context.handle(
        _categoryIDMeta,
        categoryID.isAcceptableOrUnknown(
          data['category_i_d']!,
          _categoryIDMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_categoryIDMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ProductsItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductsItem(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      description:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}description'],
          )!,
      imageUrl:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}image_url'],
          )!,
      price:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}price'],
          )!,
      categoryID:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}category_i_d'],
          )!,
    );
  }

  @override
  $ProductsItemsTable createAlias(String alias) {
    return $ProductsItemsTable(attachedDatabase, alias);
  }
}

class ProductsItem extends DataClass implements Insertable<ProductsItem> {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final String price;
  final int categoryID;
  const ProductsItem({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.categoryID,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['image_url'] = Variable<String>(imageUrl);
    map['price'] = Variable<String>(price);
    map['category_i_d'] = Variable<int>(categoryID);
    return map;
  }

  ProductsItemsCompanion toCompanion(bool nullToAbsent) {
    return ProductsItemsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      imageUrl: Value(imageUrl),
      price: Value(price),
      categoryID: Value(categoryID),
    );
  }

  factory ProductsItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductsItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      price: serializer.fromJson<String>(json['price']),
      categoryID: serializer.fromJson<int>(json['categoryID']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'price': serializer.toJson<String>(price),
      'categoryID': serializer.toJson<int>(categoryID),
    };
  }

  ProductsItem copyWith({
    int? id,
    String? name,
    String? description,
    String? imageUrl,
    String? price,
    int? categoryID,
  }) => ProductsItem(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    imageUrl: imageUrl ?? this.imageUrl,
    price: price ?? this.price,
    categoryID: categoryID ?? this.categoryID,
  );
  ProductsItem copyWithCompanion(ProductsItemsCompanion data) {
    return ProductsItem(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      price: data.price.present ? data.price.value : this.price,
      categoryID:
          data.categoryID.present ? data.categoryID.value : this.categoryID,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductsItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('price: $price, ')
          ..write('categoryID: $categoryID')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, imageUrl, price, categoryID);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductsItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.imageUrl == this.imageUrl &&
          other.price == this.price &&
          other.categoryID == this.categoryID);
}

class ProductsItemsCompanion extends UpdateCompanion<ProductsItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String> imageUrl;
  final Value<String> price;
  final Value<int> categoryID;
  final Value<int> rowid;
  const ProductsItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.price = const Value.absent(),
    this.categoryID = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsItemsCompanion.insert({
    required int id,
    required String name,
    required String description,
    required String imageUrl,
    required String price,
    required int categoryID,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       description = Value(description),
       imageUrl = Value(imageUrl),
       price = Value(price),
       categoryID = Value(categoryID);
  static Insertable<ProductsItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? imageUrl,
    Expression<String>? price,
    Expression<int>? categoryID,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (imageUrl != null) 'image_url': imageUrl,
      if (price != null) 'price': price,
      if (categoryID != null) 'category_i_d': categoryID,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? description,
    Value<String>? imageUrl,
    Value<String>? price,
    Value<int>? categoryID,
    Value<int>? rowid,
  }) {
    return ProductsItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      categoryID: categoryID ?? this.categoryID,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (price.present) {
      map['price'] = Variable<String>(price.value);
    }
    if (categoryID.present) {
      map['category_i_d'] = Variable<int>(categoryID.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('price: $price, ')
          ..write('categoryID: $categoryID, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$ProductsDatabase extends GeneratedDatabase {
  _$ProductsDatabase(QueryExecutor e) : super(e);
  $ProductsDatabaseManager get managers => $ProductsDatabaseManager(this);
  late final $ProductsItemsTable productsItems = $ProductsItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [productsItems];
}

typedef $$ProductsItemsTableCreateCompanionBuilder =
    ProductsItemsCompanion Function({
      required int id,
      required String name,
      required String description,
      required String imageUrl,
      required String price,
      required int categoryID,
      Value<int> rowid,
    });
typedef $$ProductsItemsTableUpdateCompanionBuilder =
    ProductsItemsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> description,
      Value<String> imageUrl,
      Value<String> price,
      Value<int> categoryID,
      Value<int> rowid,
    });

class $$ProductsItemsTableFilterComposer
    extends Composer<_$ProductsDatabase, $ProductsItemsTable> {
  $$ProductsItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get categoryID => $composableBuilder(
    column: $table.categoryID,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductsItemsTableOrderingComposer
    extends Composer<_$ProductsDatabase, $ProductsItemsTable> {
  $$ProductsItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get categoryID => $composableBuilder(
    column: $table.categoryID,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductsItemsTableAnnotationComposer
    extends Composer<_$ProductsDatabase, $ProductsItemsTable> {
  $$ProductsItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<int> get categoryID => $composableBuilder(
    column: $table.categoryID,
    builder: (column) => column,
  );
}

class $$ProductsItemsTableTableManager
    extends
        RootTableManager<
          _$ProductsDatabase,
          $ProductsItemsTable,
          ProductsItem,
          $$ProductsItemsTableFilterComposer,
          $$ProductsItemsTableOrderingComposer,
          $$ProductsItemsTableAnnotationComposer,
          $$ProductsItemsTableCreateCompanionBuilder,
          $$ProductsItemsTableUpdateCompanionBuilder,
          (
            ProductsItem,
            BaseReferences<
              _$ProductsDatabase,
              $ProductsItemsTable,
              ProductsItem
            >,
          ),
          ProductsItem,
          PrefetchHooks Function()
        > {
  $$ProductsItemsTableTableManager(
    _$ProductsDatabase db,
    $ProductsItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ProductsItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$ProductsItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$ProductsItemsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> imageUrl = const Value.absent(),
                Value<String> price = const Value.absent(),
                Value<int> categoryID = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductsItemsCompanion(
                id: id,
                name: name,
                description: description,
                imageUrl: imageUrl,
                price: price,
                categoryID: categoryID,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int id,
                required String name,
                required String description,
                required String imageUrl,
                required String price,
                required int categoryID,
                Value<int> rowid = const Value.absent(),
              }) => ProductsItemsCompanion.insert(
                id: id,
                name: name,
                description: description,
                imageUrl: imageUrl,
                price: price,
                categoryID: categoryID,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductsItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$ProductsDatabase,
      $ProductsItemsTable,
      ProductsItem,
      $$ProductsItemsTableFilterComposer,
      $$ProductsItemsTableOrderingComposer,
      $$ProductsItemsTableAnnotationComposer,
      $$ProductsItemsTableCreateCompanionBuilder,
      $$ProductsItemsTableUpdateCompanionBuilder,
      (
        ProductsItem,
        BaseReferences<_$ProductsDatabase, $ProductsItemsTable, ProductsItem>,
      ),
      ProductsItem,
      PrefetchHooks Function()
    >;

class $ProductsDatabaseManager {
  final _$ProductsDatabase _db;
  $ProductsDatabaseManager(this._db);
  $$ProductsItemsTableTableManager get productsItems =>
      $$ProductsItemsTableTableManager(_db, _db.productsItems);
}
