import 'package:moor_flutter/moor_flutter.dart';
part 'moor_database.g.dart';

class AppData extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get appName => text().withLength(min: 1, max: 50)();
  TextColumn get appCategory => text().withLength(min: 1, max: 50)();
  TextColumn get packageName => text().withLength(min: 1, max: 50)();
  BoolColumn get systemApp => boolean().withDefault(Constant(false))();
}

class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super((FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite', logStatements: true),);
  @override
  int get schemaVersion => 1;
}