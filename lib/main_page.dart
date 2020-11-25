import 'package:flutter/material.dart';
import 'package:tera_launcher/app_pages/all_apps.dart';
import 'package:tera_launcher/app_pages/sorted_apps.dart';
import 'package:tera_launcher/screens/launcher.dart';
import 'package:tera_launcher/settings/MyAppSettings.dart';

class MainPage extends StatefulWidget {
  final MyAppSettings settings;
  final String AppLayoutType;
  MainPage({Key key, this.AppLayoutType, this.settings}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: [Launcher(settings: widget.settings,), SortedApps(settings: widget.settings,)],
    );
  }
}
