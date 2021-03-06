import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tera_launcher/homescreen_widgets/androne_widgets/androne_widget.dart';
import 'package:tera_launcher/homescreen_widgets/vibrant/vibrant_one.dart';

class LauncherHome extends StatefulWidget {
  @override
  _LauncherHomeState createState() => _LauncherHomeState();
}

class _LauncherHomeState extends State<LauncherHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: VibrantOne(),
    );
  }
}
