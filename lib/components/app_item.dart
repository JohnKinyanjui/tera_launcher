import 'dart:ffi';

import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconpacks/iconpacks.dart';
import 'package:tera_launcher/settings/dialog_manager.dart';

class AppItem extends StatefulWidget {
  final ApplicationWithIcon app;

  const AppItem({
    Key key,
    this.app,
  }) : super(key: key);

  @override
  _AppItemState createState() => _AppItemState();
}

class _AppItemState extends State<AppItem> {
  String _platformVersion = 'Unknown';
  String iconPacks = "";
  Widget icon = null;
  @override
  void initState() {
    super.initState();
    getIcon();
  }

  Future<Void> getIcon() async {
    String platformVersion;
    try {
      platformVersion = await IconPacks.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    List iconPacks = await IconPacks.iconPacks;

    Widget n_icon =
        await IconPacks.getIcon(widget.app.packageName, iconPacks[0]);

    setState(() {
      icon = n_icon;
    });

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => DeviceApps.openApp(widget.app.packageName),
      onLongPress: () => showAppOptions(
          context,
          widget.app.icon,
          icon,
          widget.app.appName,
          widget.app.packageName,
          widget.app.versionName.toString()),
      child: Column(
        children: [
          Expanded(
            child: icon == null
                ? Container(
                    height: 50,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.memory(
                        widget.app.icon,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : icon,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Text(
              widget.app.appName,
              style: GoogleFonts.josefinSans(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 10),
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
          // Text(app.appName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 10),textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
