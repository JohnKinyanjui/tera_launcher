import 'package:flutter/material.dart';
import 'package:tera_launcher/app_pages/all_apps.dart';
import 'package:tera_launcher/app_pages/sorted_apps.dart';
import 'package:tera_launcher/screens/launcher.dart';

class MainPage extends StatefulWidget {
  final String AppLayoutType;
  MainPage({Key key, this.AppLayoutType}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: [
        Launcher(),
        widget.AppLayoutType == null ? AllApps() : SortedApps()
      ],
    );
  }
}