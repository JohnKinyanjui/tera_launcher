import 'package:device_apps/device_apps.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appsProvider = FutureProvider<List<Application>>(
    (ref) => DeviceApps.getInstalledApplications(
          includeAppIcons: true,
          includeSystemApps: true,
          onlyAppsWithLaunchIntent: true,
        ));

final appsProvider1 = FutureProvider<List<ApplicationWithIcon>>(
    (ref) => DeviceApps.getInstalledApplications(
          includeAppIcons: true,
          includeSystemApps: true,
          onlyAppsWithLaunchIntent: true,
        ));

final Stream<List<Application>> st =
    Stream.fromFuture(DeviceApps.getInstalledApplications(
  includeAppIcons: true,
  includeSystemApps: true,
  onlyAppsWithLaunchIntent: true,
));

var futureApps = DeviceApps.getInstalledApplications(
  includeAppIcons: true,
  includeSystemApps: true,
  onlyAppsWithLaunchIntent: true,
);
