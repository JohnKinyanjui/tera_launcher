import 'dart:ffi';
import 'dart:typed_data';

import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconpacks/iconpacks.dart';

class DockItem extends StatefulWidget {
  final ApplicationWithIcon app;
  final Function onpress;

  const DockItem({
    Key key,
    this.app,
    this.onpress,
  }) : super(key: key);
  @override
  _DockItemState createState() => _DockItemState();
}

class _DockItemState extends State<DockItem> {
  String _platformVersion = 'Unknown';
  String iconPacks = "";
  Uint8List icon = null;
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

    Uint8List n_icon =
        await IconPacks.getRawIcon(widget.app.packageName, iconPacks[0]);

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
      onTap: widget.onpress,
      child: Column(children: [
        Expanded(
          child: icon == null
              ? AnimatedContainer(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  duration: Duration(milliseconds: 1000),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.memory(
                      widget.app.icon,
                    ),
                  ),
                )
              : AnimatedContainer(
                  duration: Duration(milliseconds: 1000),
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.memory(
                      icon,
                    ),
                  ),
                ),
        ),
        Text(
          "",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w300, fontSize: 10),
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
