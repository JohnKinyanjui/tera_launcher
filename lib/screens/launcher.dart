import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tera_launcher/components/dock/main_dock.dart';
import 'package:tera_launcher/settings/MyAppSettings.dart';
import 'launcher_home.dart';
import 'launcher_options.dart';

class Launcher extends StatefulWidget {
  final MyAppSettings settings;

  const Launcher({Key key, this.settings}) : super(key: key);
  @override
  _LauncherState createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      drawerScrimColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          SizedBox(height: 40,),

          Expanded(
            child: PageView(
              children: [
                LauncherHome(),
                LauncherOptions(),
              ],
            ),
          ),
         MainDock(settings: widget.settings,)
        ],
      ),
      drawer: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Container(
          height: height,
          width: 300,
          color: Colors.deepPurpleAccent.withOpacity(0.2),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
