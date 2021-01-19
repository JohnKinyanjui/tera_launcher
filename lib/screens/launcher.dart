import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tera_launcher/app_pages/sorted_apps.dart';
import 'package:tera_launcher/components/dock/main_dock.dart';
import 'package:tera_launcher/settings/app_config/MyAppSettings.dart';
import 'launcher_home.dart';
import 'launcher_options.dart';

class Launcher extends ConsumerWidget {
  final MyAppSettings settings;

  const Launcher({Key key, this.settings}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      drawerScrimColor: Colors.black.withOpacity(0.5),
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onPanStart: (e) => Navigator.of(context).push(_createRoute(SortedApps(
          settings: settings,
        ))),
        child: PageView(
          children: [
            LauncherHome(),
            LauncherOptions(),
          ],
        ),
      ),
      drawer: MainDock(
        settings: settings,
      ),
    );
  }
}

Route _createRoute(
  Widget page,
) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
