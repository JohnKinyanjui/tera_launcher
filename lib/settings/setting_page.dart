import 'package:flutter/material.dart';
import 'package:tera_launcher/app_pages/all_apps.dart';
import 'package:tera_launcher/components/settings_component/setting_item.dart';
import 'package:tera_launcher/settings/MyAppSettings.dart';

class SettingPage extends StatefulWidget {
  final MyAppSettings settings;

  const SettingPage({Key key, this.settings}) : super(key: key);
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40,),
            Text("Settings", style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.w900)),
            SizedBox(height: 20,),
            Text("Appearance", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
            SizedBox(height: 20,),
            SettingItem(
              onpress: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AllApps(settings: widget.settings,))),
              label: "Dock Apps",
              sub: "Change application in the home screen dock.",
            ),
            SettingItem(
              label: "Icons",
              sub: "Change Icon Size and Shape",
            )
          ],
        ),
      ),
    );
  }
}
