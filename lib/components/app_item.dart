import 'dart:ffi';
import 'dart:typed_data';

import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconpacks/iconpacks.dart';

class AppItem extends StatefulWidget {
  final ApplicationWithIcon app;
  final Function onpress;
  final bool textVisible;
  const AppItem({
    Key key,
    this.app,
    this.onpress,
    this.textVisible,
  }) : super(key: key);

  @override
  _AppItemState createState() => _AppItemState();
}

class _AppItemState extends State<AppItem> with AutomaticKeepAliveClientMixin {
  String _platformVersion = 'Unknown';
  String iconPacks = "";
  Uint8List icon = null;
  Uint8List o_icon = null;
  @override
  void initState() {
    super.initState();
    getIcon();
    getOriginalIcon();
  }

  Future<Void> getIcon() async {
    String platformVersion;
    try {
      platformVersion = await IconPacks.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    List iconPacks = await IconPacks.iconPacks;

    //Use this part to get the list of icon packs
    Uint8List n_icon =
        await IconPacks.getRawIcon(widget.app.packageName, iconPacks[5]);

    setState(() {
      icon = n_icon;
    });

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future<Void> getOriginalIcon() async {
    setState(() {
      o_icon = widget.app.icon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onpress,
      child: Column(
        children: [
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
                        o_icon,
                      ),
                    ),
                  )
                : Container(
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
          SizedBox(
            height: 10,
          ),
          Visibility(
            visible: widget.textVisible == null ? true : widget.textVisible,
            child: Expanded(
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
          ),
          // Text(app.appName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 10),textAlign: TextAlign.center,)
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class IconContainer extends StatelessWidget {
  final Uint8List icon;

  const IconContainer({Key key, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
