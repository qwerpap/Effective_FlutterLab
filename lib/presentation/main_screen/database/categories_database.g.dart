// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_database.dart';

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

abstract class _$CategoriesDatabase extends GeneratedDatabase {
  _$CategoriesDatabase(QueryExecutor e) : super(e);
  $CategoriesDatabaseManager get managers => $CategoriesDatabaseManager(this);
  late final $CategoriesItemsTable categoriesItems = $CategoriesItemsTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [categoriesItems];
}

typedef $$CategoriesItemsTableCreateCompanionBuilder =
    CategoriesItemsCompanion Function({Value<int> id, required String slug});
typedef $$CategoriesItemsTableUpdateCompanionBuilder =
    CategoriesItemsCompanion Function({Value<int> id, Value<String> slug});

class $$CategoriesItemsTableFilterComposer
    extends Composer<_$CategoriesDatabase, $CategoriesItemsTable> {
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
}

class $$CategoriesItemsTableOrderingComposer
    extends Composer<_$CategoriesDatabase, $CategoriesItemsTable> {
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
    extends Composer<_$CategoriesDatabase, $CategoriesItemsTable> {
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
}

class $$CategoriesItemsTableTableManager
    extends
        RootTableManager<
          _$CategoriesDatabase,
          $CategoriesItemsTable,
          CategoriesItem,
          $$CategoriesItemsTableFilterComposer,
          $$CategoriesItemsTableOrderingComposer,
          $$CategoriesItemsTableAnnotationComposer,
          $$CategoriesItemsTableCreateCompanionBuilder,
          $$CategoriesItemsTableUpdateCompanionBuilder,
          (
            CategoriesItem,
            BaseReferences<
              _$CategoriesDatabase,
              $CategoriesItemsTable,
              CategoriesItem
            >,
          ),
          CategoriesItem,
          PrefetchHooks Function()
        > {
  $$CategoriesItemsTableTableManager(
    _$CategoriesDatabase db,
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
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CategoriesItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$CategoriesDatabase,
      $CategoriesItemsTable,
      CategoriesItem,
      $$CategoriesItemsTableFilterComposer,
      $$CategoriesItemsTableOrderingComposer,
      $$CategoriesItemsTableAnnotationComposer,
      $$CategoriesItemsTableCreateCompanionBuilder,
      $$CategoriesItemsTableUpdateCompanionBuilder,
      (
        CategoriesItem,
        BaseReferences<
          _$CategoriesDatabase,
          $CategoriesItemsTable,
          CategoriesItem
        >,
      ),
      CategoriesItem,
      PrefetchHooks Function()
    >;

class $CategoriesDatabaseManager {
  final _$CategoriesDatabase _db;
  $CategoriesDatabaseManager(this._db);
  $$CategoriesItemsTableTableManager get categoriesItems =>
      $$CategoriesItemsTableTableManager(_db, _db.categoriesItems);
}
