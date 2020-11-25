// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class AppDataData extends DataClass implements Insertable<AppDataData> {
  final int id;
  final String appName;
  final String appCategory;
  final String packageName;
  final bool systemApp;
  AppDataData(
      {this.id,
      @required this.appName,
      @required this.appCategory,
      @required this.packageName,
      @required this.systemApp});
  factory AppDataData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return AppDataData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      appName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}app_name']),
      appCategory: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}app_category']),
      packageName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}package_name']),
      systemApp: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}system_app']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || appName != null) {
      map['app_name'] = Variable<String>(appName);
    }
    if (!nullToAbsent || appCategory != null) {
      map['app_category'] = Variable<String>(appCategory);
    }
    if (!nullToAbsent || packageName != null) {
      map['package_name'] = Variable<String>(packageName);
    }
    if (!nullToAbsent || systemApp != null) {
      map['system_app'] = Variable<bool>(systemApp);
    }
    return map;
  }

  AppDataCompanion toCompanion(bool nullToAbsent) {
    return AppDataCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      appName: appName == null && nullToAbsent
          ? const Value.absent()
          : Value(appName),
      appCategory: appCategory == null && nullToAbsent
          ? const Value.absent()
          : Value(appCategory),
      packageName: packageName == null && nullToAbsent
          ? const Value.absent()
          : Value(packageName),
      systemApp: systemApp == null && nullToAbsent
          ? const Value.absent()
          : Value(systemApp),
    );
  }

  factory AppDataData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return AppDataData(
      id: serializer.fromJson<int>(json['id']),
      appName: serializer.fromJson<String>(json['appName']),
      appCategory: serializer.fromJson<String>(json['appCategory']),
      packageName: serializer.fromJson<String>(json['packageName']),
      systemApp: serializer.fromJson<bool>(json['systemApp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'appName': serializer.toJson<String>(appName),
      'appCategory': serializer.toJson<String>(appCategory),
      'packageName': serializer.toJson<String>(packageName),
      'systemApp': serializer.toJson<bool>(systemApp),
    };
  }

  AppDataData copyWith(
          {int id,
          String appName,
          String appCategory,
          String packageName,
          bool systemApp}) =>
      AppDataData(
        id: id ?? this.id,
        appName: appName ?? this.appName,
        appCategory: appCategory ?? this.appCategory,
        packageName: packageName ?? this.packageName,
        systemApp: systemApp ?? this.systemApp,
      );
  @override
  String toString() {
    return (StringBuffer('AppDataData(')
          ..write('id: $id, ')
          ..write('appName: $appName, ')
          ..write('appCategory: $appCategory, ')
          ..write('packageName: $packageName, ')
          ..write('systemApp: $systemApp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          appName.hashCode,
          $mrjc(appCategory.hashCode,
              $mrjc(packageName.hashCode, systemApp.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is AppDataData &&
          other.id == this.id &&
          other.appName == this.appName &&
          other.appCategory == this.appCategory &&
          other.packageName == this.packageName &&
          other.systemApp == this.systemApp);
}

class AppDataCompanion extends UpdateCompanion<AppDataData> {
  final Value<int> id;
  final Value<String> appName;
  final Value<String> appCategory;
  final Value<String> packageName;
  final Value<bool> systemApp;
  const AppDataCompanion({
    this.id = const Value.absent(),
    this.appName = const Value.absent(),
    this.appCategory = const Value.absent(),
    this.packageName = const Value.absent(),
    this.systemApp = const Value.absent(),
  });
  AppDataCompanion.insert({
    this.id = const Value.absent(),
    @required String appName,
    @required String appCategory,
    @required String packageName,
    this.systemApp = const Value.absent(),
  })  : appName = Value(appName),
        appCategory = Value(appCategory),
        packageName = Value(packageName);
  static Insertable<AppDataData> custom({
    Expression<int> id,
    Expression<String> appName,
    Expression<String> appCategory,
    Expression<String> packageName,
    Expression<bool> systemApp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (appName != null) 'app_name': appName,
      if (appCategory != null) 'app_category': appCategory,
      if (packageName != null) 'package_name': packageName,
      if (systemApp != null) 'system_app': systemApp,
    });
  }

  AppDataCompanion copyWith(
      {Value<int> id,
      Value<String> appName,
      Value<String> appCategory,
      Value<String> packageName,
      Value<bool> systemApp}) {
    return AppDataCompanion(
      id: id ?? this.id,
      appName: appName ?? this.appName,
      appCategory: appCategory ?? this.appCategory,
      packageName: packageName ?? this.packageName,
      systemApp: systemApp ?? this.systemApp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (appName.present) {
      map['app_name'] = Variable<String>(appName.value);
    }
    if (appCategory.present) {
      map['app_category'] = Variable<String>(appCategory.value);
    }
    if (packageName.present) {
      map['package_name'] = Variable<String>(packageName.value);
    }
    if (systemApp.present) {
      map['system_app'] = Variable<bool>(systemApp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppDataCompanion(')
          ..write('id: $id, ')
          ..write('appName: $appName, ')
          ..write('appCategory: $appCategory, ')
          ..write('packageName: $packageName, ')
          ..write('systemApp: $systemApp')
          ..write(')'))
        .toString();
  }
}

class $AppDataTable extends AppData with TableInfo<$AppDataTable, AppDataData> {
  final GeneratedDatabase _db;
  final String _alias;
  $AppDataTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _appNameMeta = const VerificationMeta('appName');
  GeneratedTextColumn _appName;
  @override
  GeneratedTextColumn get appName => _appName ??= _constructAppName();
  GeneratedTextColumn _constructAppName() {
    return GeneratedTextColumn('app_name', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _appCategoryMeta =
      const VerificationMeta('appCategory');
  GeneratedTextColumn _appCategory;
  @override
  GeneratedTextColumn get appCategory =>
      _appCategory ??= _constructAppCategory();
  GeneratedTextColumn _constructAppCategory() {
    return GeneratedTextColumn('app_category', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _packageNameMeta =
      const VerificationMeta('packageName');
  GeneratedTextColumn _packageName;
  @override
  GeneratedTextColumn get packageName =>
      _packageName ??= _constructPackageName();
  GeneratedTextColumn _constructPackageName() {
    return GeneratedTextColumn('package_name', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _systemAppMeta = const VerificationMeta('systemApp');
  GeneratedBoolColumn _systemApp;
  @override
  GeneratedBoolColumn get systemApp => _systemApp ??= _constructSystemApp();
  GeneratedBoolColumn _constructSystemApp() {
    return GeneratedBoolColumn('system_app', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, appName, appCategory, packageName, systemApp];
  @override
  $AppDataTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'app_data';
  @override
  final String actualTableName = 'app_data';
  @override
  VerificationContext validateIntegrity(Insertable<AppDataData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('app_name')) {
      context.handle(_appNameMeta,
          appName.isAcceptableOrUnknown(data['app_name'], _appNameMeta));
    } else if (isInserting) {
      context.missing(_appNameMeta);
    }
    if (data.containsKey('app_category')) {
      context.handle(
          _appCategoryMeta,
          appCategory.isAcceptableOrUnknown(
              data['app_category'], _appCategoryMeta));
    } else if (isInserting) {
      context.missing(_appCategoryMeta);
    }
    if (data.containsKey('package_name')) {
      context.handle(
          _packageNameMeta,
          packageName.isAcceptableOrUnknown(
              data['package_name'], _packageNameMeta));
    } else if (isInserting) {
      context.missing(_packageNameMeta);
    }
    if (data.containsKey('system_app')) {
      context.handle(_systemAppMeta,
          systemApp.isAcceptableOrUnknown(data['system_app'], _systemAppMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppDataData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return AppDataData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $AppDataTable createAlias(String alias) {
    return $AppDataTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $AppDataTable _appData;
  $AppDataTable get appData => _appData ??= $AppDataTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [appData];
}
