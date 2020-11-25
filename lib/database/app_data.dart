import 'package:moor_flutter/moor_flutter.dart';
part 'app_data.g.dart';

class AppData extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get appName => text().withLength(min: 1, max: 50)();
  TextColumn get appCategory => text().withLength(min: 1, max: 50)();
  TextColumn get packageName => text().withLength(min: 1, max: 50)();
  BoolColumn get systemApp => boolean().withDefault(Constant(false))();
}

@UseMoor(tables: [AppData])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super((FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true)));

  @override
  int get schemaVersion => 1;
  Future<List<AppDataData>> getAllApps() => select(appData).get();
  Stream<List<AppDataData>> watchAllApps() => select(appData).watch();
  Future insertTask(AppDataData app) => into(appData).insert(app);
  Future updateTask(AppDataData app) => update(appData).replace(app);
  Future deleteTask(AppDataData app) => delete(appData).delete(app);
}
