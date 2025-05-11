// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations_database.dart';

// ignore_for_file: type=lint
class $LocationsItemsTable extends LocationsItems
    with TableInfo<$LocationsItemsTable, LocationsItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocationsItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longMeta = const VerificationMeta('long');
  @override
  late final GeneratedColumn<double> long = GeneratedColumn<double>(
    'long',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [address, lat, long];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'locations_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocationsItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('long')) {
      context.handle(
        _longMeta,
        long.isAcceptableOrUnknown(data['long']!, _longMeta),
      );
    } else if (isInserting) {
      context.missing(_longMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  LocationsItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocationsItem(
      address:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}address'],
          )!,
      lat:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}lat'],
          )!,
      long:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}long'],
          )!,
    );
  }

  @override
  $LocationsItemsTable createAlias(String alias) {
    return $LocationsItemsTable(attachedDatabase, alias);
  }
}

class LocationsItem extends DataClass implements Insertable<LocationsItem> {
  final String address;
  final double lat;
  final double long;
  const LocationsItem({
    required this.address,
    required this.lat,
    required this.long,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['address'] = Variable<String>(address);
    map['lat'] = Variable<double>(lat);
    map['long'] = Variable<double>(long);
    return map;
  }

  LocationsItemsCompanion toCompanion(bool nullToAbsent) {
    return LocationsItemsCompanion(
      address: Value(address),
      lat: Value(lat),
      long: Value(long),
    );
  }

  factory LocationsItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocationsItem(
      address: serializer.fromJson<String>(json['address']),
      lat: serializer.fromJson<double>(json['lat']),
      long: serializer.fromJson<double>(json['long']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'address': serializer.toJson<String>(address),
      'lat': serializer.toJson<double>(lat),
      'long': serializer.toJson<double>(long),
    };
  }

  LocationsItem copyWith({String? address, double? lat, double? long}) =>
      LocationsItem(
        address: address ?? this.address,
        lat: lat ?? this.lat,
        long: long ?? this.long,
      );
  LocationsItem copyWithCompanion(LocationsItemsCompanion data) {
    return LocationsItem(
      address: data.address.present ? data.address.value : this.address,
      lat: data.lat.present ? data.lat.value : this.lat,
      long: data.long.present ? data.long.value : this.long,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocationsItem(')
          ..write('address: $address, ')
          ..write('lat: $lat, ')
          ..write('long: $long')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(address, lat, long);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocationsItem &&
          other.address == this.address &&
          other.lat == this.lat &&
          other.long == this.long);
}

class LocationsItemsCompanion extends UpdateCompanion<LocationsItem> {
  final Value<String> address;
  final Value<double> lat;
  final Value<double> long;
  final Value<int> rowid;
  const LocationsItemsCompanion({
    this.address = const Value.absent(),
    this.lat = const Value.absent(),
    this.long = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocationsItemsCompanion.insert({
    required String address,
    required double lat,
    required double long,
    this.rowid = const Value.absent(),
  }) : address = Value(address),
       lat = Value(lat),
       long = Value(long);
  static Insertable<LocationsItem> custom({
    Expression<String>? address,
    Expression<double>? lat,
    Expression<double>? long,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (address != null) 'address': address,
      if (lat != null) 'lat': lat,
      if (long != null) 'long': long,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocationsItemsCompanion copyWith({
    Value<String>? address,
    Value<double>? lat,
    Value<double>? long,
    Value<int>? rowid,
  }) {
    return LocationsItemsCompanion(
      address: address ?? this.address,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (long.present) {
      map['long'] = Variable<double>(long.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocationsItemsCompanion(')
          ..write('address: $address, ')
          ..write('lat: $lat, ')
          ..write('long: $long, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocationsDatabase extends GeneratedDatabase {
  _$LocationsDatabase(QueryExecutor e) : super(e);
  $LocationsDatabaseManager get managers => $LocationsDatabaseManager(this);
  late final $LocationsItemsTable locationsItems = $LocationsItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [locationsItems];
}

typedef $$LocationsItemsTableCreateCompanionBuilder =
    LocationsItemsCompanion Function({
      required String address,
      required double lat,
      required double long,
      Value<int> rowid,
    });
typedef $$LocationsItemsTableUpdateCompanionBuilder =
    LocationsItemsCompanion Function({
      Value<String> address,
      Value<double> lat,
      Value<double> long,
      Value<int> rowid,
    });

class $$LocationsItemsTableFilterComposer
    extends Composer<_$LocationsDatabase, $LocationsItemsTable> {
  $$LocationsItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get long => $composableBuilder(
    column: $table.long,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocationsItemsTableOrderingComposer
    extends Composer<_$LocationsDatabase, $LocationsItemsTable> {
  $$LocationsItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get long => $composableBuilder(
    column: $table.long,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocationsItemsTableAnnotationComposer
    extends Composer<_$LocationsDatabase, $LocationsItemsTable> {
  $$LocationsItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get long =>
      $composableBuilder(column: $table.long, builder: (column) => column);
}

class $$LocationsItemsTableTableManager
    extends
        RootTableManager<
          _$LocationsDatabase,
          $LocationsItemsTable,
          LocationsItem,
          $$LocationsItemsTableFilterComposer,
          $$LocationsItemsTableOrderingComposer,
          $$LocationsItemsTableAnnotationComposer,
          $$LocationsItemsTableCreateCompanionBuilder,
          $$LocationsItemsTableUpdateCompanionBuilder,
          (
            LocationsItem,
            BaseReferences<
              _$LocationsDatabase,
              $LocationsItemsTable,
              LocationsItem
            >,
          ),
          LocationsItem,
          PrefetchHooks Function()
        > {
  $$LocationsItemsTableTableManager(
    _$LocationsDatabase db,
    $LocationsItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$LocationsItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$LocationsItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$LocationsItemsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> address = const Value.absent(),
                Value<double> lat = const Value.absent(),
                Value<double> long = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocationsItemsCompanion(
                address: address,
                lat: lat,
                long: long,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String address,
                required double lat,
                required double long,
                Value<int> rowid = const Value.absent(),
              }) => LocationsItemsCompanion.insert(
                address: address,
                lat: lat,
                long: long,
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

typedef $$LocationsItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$LocationsDatabase,
      $LocationsItemsTable,
      LocationsItem,
      $$LocationsItemsTableFilterComposer,
      $$LocationsItemsTableOrderingComposer,
      $$LocationsItemsTableAnnotationComposer,
      $$LocationsItemsTableCreateCompanionBuilder,
      $$LocationsItemsTableUpdateCompanionBuilder,
      (
        LocationsItem,
        BaseReferences<
          _$LocationsDatabase,
          $LocationsItemsTable,
          LocationsItem
        >,
      ),
      LocationsItem,
      PrefetchHooks Function()
    >;

class $LocationsDatabaseManager {
  final _$LocationsDatabase _db;
  $LocationsDatabaseManager(this._db);
  $$LocationsItemsTableTableManager get locationsItems =>
      $$LocationsItemsTableTableManager(_db, _db.locationsItems);
}
