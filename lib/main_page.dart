import 'package:flutter/material.dart';
import 'package:tera_launcher/screens/app_page.dart';
import 'package:tera_launcher/screens/launcher.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

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
        AppPage()
      ],
    );
  }
}