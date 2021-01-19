import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinity_ui/infinity_ui.dart';
import 'package:tera_launcher/app_pages/sorted_apps.dart';
import 'package:tera_launcher/screens/launcher.dart';
import 'package:tera_launcher/settings/app_config/MyAppSettings.dart';

class MainPage extends ConsumerWidget {
  final MyAppSettings settings;
  MainPage({Key key, this.settings}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onHorizontalDragStart: (e) =>
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SortedApps(
                      settings: settings,
                    ))),
        child: SafeInfinityUi(
          background: Container(
            color: Colors.transparent,
          ),
          statusBarBackground: Container(
            color: Colors.transparent,
          ),
          navigationBarBackground: Container(
            color: Colors.transparent,
          ),
          child: Launcher(
            settings: settings,
          ),
        ),
      ),
    );
  }
}
