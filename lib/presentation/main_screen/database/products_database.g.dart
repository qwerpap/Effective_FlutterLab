// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_database.dart';

// ignore_for_file: type=lint
class $CategoriesItemsTable extends CategoriesItems
    with TableInfo<$CategoriesItemsTable, CategoriesItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _slugMeta = const VerificationMeta('slug');
  @override
  late final GeneratedColumn<String> slug = GeneratedColumn<String>(
    'slug',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, slug];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoriesItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('slug')) {
      context.handle(
        _slugMeta,
        slug.isAcceptableOrUnknown(data['slug']!, _slugMeta),
      );
    } else if (isInserting) {
      context.missing(_slugMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoriesItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoriesItem(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      slug:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}slug'],
          )!,
    );
  }

  @override
  $CategoriesItemsTable createAlias(String alias) {
    return $CategoriesItemsTable(attachedDatabase, alias);
  }
}

class CategoriesItem extends DataClass implements Insertable<CategoriesItem> {
  final int id;
  final String slug;
  const CategoriesItem({required this.id, required this.slug});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['slug'] = Variable<String>(slug);
    return map;
  }

  CategoriesItemsCompanion toCompanion(bool nullToAbsent) {
    return CategoriesItemsCompanion(id: Value(id), slug: Value(slug));
  }

  factory CategoriesItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoriesItem(
      id: serializer.fromJson<int>(json['id']),
      slug: serializer.fromJson<String>(json['slug']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'slug': serializer.toJson<String>(slug),
    };
  }

  CategoriesItem copyWith({int? id, String? slug}) =>
      CategoriesItem(id: id ?? this.id, slug: slug ?? this.slug);
  CategoriesItem copyWithCompanion(CategoriesItemsCompanion data) {
    return CategoriesItem(
      id: data.id.present ? data.id.value : this.id,
      slug: data.slug.present ? data.slug.value : this.slug,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesItem(')
          ..write('id: $id, ')
          ..write('slug: $slug')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, slug);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoriesItem &&
          other.id == this.id &&
          other.slug == this.slug);
}

class CategoriesItemsCompanion extends UpdateCompanion<CategoriesItem> {
  final Value<int> id;
  final Value<String> slug;
  const CategoriesItemsCompanion({
    this.id = const Value.absent(),
    this.slug = const Value.absent(),
  });
  CategoriesItemsCompanion.insert({
    this.id = const Value.absent(),
    required String slug,
  }) : slug = Value(slug);
  static Insertable<CategoriesItem> custom({
    Expression<int>? id,
    Expression<String>? slug,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (slug != null) 'slug': slug,
    });
  }

  CategoriesItemsCompanion copyWith({Value<int>? id, Value<String>? slug}) {
    return CategoriesItemsCompanion(id: id ?? this.id, slug: slug ?? this.slug);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (slug.present) {
      map['slug'] = Variable<String>(slug.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesItemsCompanion(')
          ..write('id: $id, ')
          ..write('slug: $slug')
          ..write(')'))
        .toString();
  }
}

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
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
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
    $customConstraints: 'REFERENCES categories_items(id)',
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
  Set<GeneratedColumn> get $primaryKey => {id};
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
  const ProductsItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.price = const Value.absent(),
    this.categoryID = const Value.absent(),
  });
  ProductsItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    required String imageUrl,
    required String price,
    required int categoryID,
  }) : name = Value(name),
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
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (imageUrl != null) 'image_url': imageUrl,
      if (price != null) 'price': price,
      if (categoryID != null) 'category_i_d': categoryID,
    });
  }

  ProductsItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? description,
    Value<String>? imageUrl,
    Value<String>? price,
    Value<int>? categoryID,
  }) {
    return ProductsItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      categoryID: categoryID ?? this.categoryID,
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
          ..write('categoryID: $categoryID')
          ..write(')'))
        .toString();
  }
}

abstract class _$ProductsDatabase extends GeneratedDatabase {
  _$ProductsDatabase(QueryExecutor e) : super(e);
  $ProductsDatabaseManager get managers => $ProductsDatabaseManager(this);
  late final $CategoriesItemsTable categoriesItems = $CategoriesItemsTable(
    this,
  );
  late final $ProductsItemsTable productsItems = $ProductsItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    categoriesItems,
    productsItems,
  ];
}

typedef $$CategoriesItemsTableCreateCompanionBuilder =
    CategoriesItemsCompanion Function({Value<int> id, required String slug});
typedef $$CategoriesItemsTableUpdateCompanionBuilder =
    CategoriesItemsCompanion Function({Value<int> id, Value<String> slug});

final class $$CategoriesItemsTableReferences
    extends
        BaseReferences<
          _$ProductsDatabase,
          $CategoriesItemsTable,
          CategoriesItem
        > {
  $$CategoriesItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ProductsItemsTable, List<ProductsItem>>
  _productsItemsRefsTable(_$ProductsDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.productsItems,
        aliasName: $_aliasNameGenerator(
          db.categoriesItems.id,
          db.productsItems.categoryID,
        ),
      );

  $$ProductsItemsTableProcessedTableManager get productsItemsRefs {
    final manager = $$ProductsItemsTableTableManager(
      $_db,
      $_db.productsItems,
    ).filter((f) => f.categoryID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_productsItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoriesItemsTableFilterComposer
    extends Composer<_$ProductsDatabase, $CategoriesItemsTable> {
  $$CategoriesItemsTableFilterComposer({
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

  ColumnFilters<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> productsItemsRefs(
    Expression<bool> Function($$ProductsItemsTableFilterComposer f) f,
  ) {
    final $$ProductsItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productsItems,
      getReferencedColumn: (t) => t.categoryID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsItemsTableFilterComposer(
            $db: $db,
            $table: $db.productsItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesItemsTableOrderingComposer
    extends Composer<_$ProductsDatabase, $CategoriesItemsTable> {
  $$CategoriesItemsTableOrderingComposer({
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

  ColumnOrderings<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriesItemsTableAnnotationComposer
    extends Composer<_$ProductsDatabase, $CategoriesItemsTable> {
  $$CategoriesItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get slug =>
      $composableBuilder(column: $table.slug, builder: (column) => column);

  Expression<T> productsItemsRefs<T extends Object>(
    Expression<T> Function($$ProductsItemsTableAnnotationComposer a) f,
  ) {
    final $$ProductsItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productsItems,
      getReferencedColumn: (t) => t.categoryID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.productsItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesItemsTableTableManager
    extends
        RootTableManager<
          _$ProductsDatabase,
          $CategoriesItemsTable,
          CategoriesItem,
          $$CategoriesItemsTableFilterComposer,
          $$CategoriesItemsTableOrderingComposer,
          $$CategoriesItemsTableAnnotationComposer,
          $$CategoriesItemsTableCreateCompanionBuilder,
          $$CategoriesItemsTableUpdateCompanionBuilder,
          (CategoriesItem, $$CategoriesItemsTableReferences),
          CategoriesItem,
          PrefetchHooks Function({bool productsItemsRefs})
        > {
  $$CategoriesItemsTableTableManager(
    _$ProductsDatabase db,
    $CategoriesItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$CategoriesItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CategoriesItemsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$CategoriesItemsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> slug = const Value.absent(),
              }) => CategoriesItemsCompanion(id: id, slug: slug),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String slug}) =>
                  CategoriesItemsCompanion.insert(id: id, slug: slug),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$CategoriesItemsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({productsItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (productsItemsRefs) db.productsItems,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productsItemsRefs)
                    await $_getPrefetchedData<
                      CategoriesItem,
                      $CategoriesItemsTable,
                      ProductsItem
                    >(
                      currentTable: table,
                      referencedTable: $$CategoriesItemsTableReferences
                          ._productsItemsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$CategoriesItemsTableReferences(
                                db,
                                table,
                                p0,
                              ).productsItemsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.categoryID == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CategoriesItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$ProductsDatabase,
      $CategoriesItemsTable,
      CategoriesItem,
      $$CategoriesItemsTableFilterComposer,
      $$CategoriesItemsTableOrderingComposer,
      $$CategoriesItemsTableAnnotationComposer,
      $$CategoriesItemsTableCreateCompanionBuilder,
      $$CategoriesItemsTableUpdateCompanionBuilder,
      (CategoriesItem, $$CategoriesItemsTableReferences),
      CategoriesItem,
      PrefetchHooks Function({bool productsItemsRefs})
    >;
typedef $$ProductsItemsTableCreateCompanionBuilder =
    ProductsItemsCompanion Function({
      Value<int> id,
      required String name,
      required String description,
      required String imageUrl,
      required String price,
      required int categoryID,
    });
typedef $$ProductsItemsTableUpdateCompanionBuilder =
    ProductsItemsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> description,
      Value<String> imageUrl,
      Value<String> price,
      Value<int> categoryID,
    });

final class $$ProductsItemsTableReferences
    extends
        BaseReferences<_$ProductsDatabase, $ProductsItemsTable, ProductsItem> {
  $$ProductsItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CategoriesItemsTable _categoryIDTable(_$ProductsDatabase db) =>
      db.categoriesItems.createAlias(
        $_aliasNameGenerator(
          db.productsItems.categoryID,
          db.categoriesItems.id,
        ),
      );

  $$CategoriesItemsTableProcessedTableManager get categoryID {
    final $_column = $_itemColumn<int>('category_i_d')!;

    final manager = $$CategoriesItemsTableTableManager(
      $_db,
      $_db.categoriesItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

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

  $$CategoriesItemsTableFilterComposer get categoryID {
    final $$CategoriesItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryID,
      referencedTable: $db.categoriesItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesItemsTableFilterComposer(
            $db: $db,
            $table: $db.categoriesItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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

  $$CategoriesItemsTableOrderingComposer get categoryID {
    final $$CategoriesItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryID,
      referencedTable: $db.categoriesItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesItemsTableOrderingComposer(
            $db: $db,
            $table: $db.categoriesItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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

  $$CategoriesItemsTableAnnotationComposer get categoryID {
    final $$CategoriesItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryID,
      referencedTable: $db.categoriesItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.categoriesItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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
          (ProductsItem, $$ProductsItemsTableReferences),
          ProductsItem,
          PrefetchHooks Function({bool categoryID})
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
              }) => ProductsItemsCompanion(
                id: id,
                name: name,
                description: description,
                imageUrl: imageUrl,
                price: price,
                categoryID: categoryID,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String description,
                required String imageUrl,
                required String price,
                required int categoryID,
              }) => ProductsItemsCompanion.insert(
                id: id,
                name: name,
                description: description,
                imageUrl: imageUrl,
                price: price,
                categoryID: categoryID,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$ProductsItemsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({categoryID = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (categoryID) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.categoryID,
                            referencedTable: $$ProductsItemsTableReferences
                                ._categoryIDTable(db),
                            referencedColumn:
                                $$ProductsItemsTableReferences
                                    ._categoryIDTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
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
      (ProductsItem, $$ProductsItemsTableReferences),
      ProductsItem,
      PrefetchHooks Function({bool categoryID})
    >;

class $ProductsDatabaseManager {
  final _$ProductsDatabase _db;
  $ProductsDatabaseManager(this._db);
  $$CategoriesItemsTableTableManager get categoriesItems =>
      $$CategoriesItemsTableTableManager(_db, _db.categoriesItems);
  $$ProductsItemsTableTableManager get productsItems =>
      $$ProductsItemsTableTableManager(_db, _db.productsItems);
}
