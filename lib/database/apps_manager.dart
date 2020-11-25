import 'package:device_apps/device_apps.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tera_launcher/database/app_data.dart';

void addApp(
    BuildContext context, appName, appCategory, packageName, systemApp) {
  final database = Provider.of<AppDatabase>(context, listen: false);
  final app = AppDataData(
    appName: appName,
    appCategory: appCategory,
    packageName: packageName,
    systemApp: systemApp,
  );
  database.insertTask(app);
}

void deleteApp(BuildContext context, AppDataData app) {
  final database = Provider.of<AppDatabase>(context);
  database.deleteTask(app);
}

void addAppsToDatabase(AppDatabase database) async {
  List<Application> apps = await DeviceApps.getInstalledApplications(
      onlyAppsWithLaunchIntent: true, includeSystemApps: true);
  for (var i = 0; i < apps.length; i++) {
    final app = AppDataData(
        appName: apps[i].appName,
        packageName: apps[i].packageName,
        systemApp: apps[i].systemApp,
        appCategory: apps[i].category.toString());
    database.insertTask(app);
  }
}

Future<bool> DbAppExists(BuildContext context, PackageName) async {
  final database = Provider.of<AppDatabase>(context);
  List<AppDataData> all_apps = await database.getAllApps();
  for (var i = 0; i < all_apps.length; i++) {
    if (all_apps[i].packageName == PackageName) {
      return true;
    } else {
      return true;
    }
  }
}

Future<AppDataData> getApp(BuildContext context, PackageName) async {
  final database = Provider.of<AppDatabase>(context);
  List<AppDataData> all_apps = await database.getAllApps();
  for (var i = 0; i < all_apps.length; i++) {
    if (all_apps[i].packageName == PackageName) {
      return all_apps[i];
    } else {
      return all_apps[i];
    }
  }
}

Future<void> RefreshDatabase(BuildContext context) async {
  List<Application> apps = await DeviceApps.getInstalledApplications(
      onlyAppsWithLaunchIntent: true, includeSystemApps: true);

  for (var i = 0; i < apps.length; i++) {
    bool isInstalled = await DeviceApps.isAppInstalled(apps[i].packageName);
    bool isInDatabase = await DbAppExists(context, apps[i].packageName);
    if (isInstalled == true) {
      if (isInDatabase == false) {
        addApp(context, apps[i].appName, apps[i].category, apps[i].packageName,
            apps[i].systemApp);
      }
    } else {
      if (isInDatabase == true) {
        AppDataData app = await getApp(context, apps[i].packageName);
        deleteApp(context, app);
      }
    }
  }
}
