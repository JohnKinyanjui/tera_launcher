import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:infinity_ui/infinity_ui.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:tera_launcher/settings/app_config/MyAppSettings.dart';

class IconSettingPage extends StatelessWidget {
  final MyAppSettings settings;

  const IconSettingPage({Key key, this.settings});
  @override
  Widget build(BuildContext context) {
    return SafeInfinityUi(
      background: Container(color: Colors.blue),
      navigationBarBackground: Container(color: Colors.blue),
      statusBarBackground: Container(color: Colors.blue),
      child: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Icon Settings',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600)),
        ),
        body: SettingsList(
          backgroundColor: Colors.white,
          sections: [
            SettingsSection(
              tiles: [
                SettingsTile(
                  title: 'Icon Pack',
                  subtitle: 'change your icon pack',
                  leading: Icon(Icons.language),
                  
                  onTap: () {
                    print("dj");
                  },
                ),
                SettingsTile(
                  title: 'Dock',
                  subtitle: 'Select apps to be shown in docks',
                  leading: Icon(Icons.dock),
                  onPressed: (context) {
                    print("dj");
                  },
                ),
                SettingsTile(
                  title: 'Icons',
                  subtitle: 'Customize your icons',
                  leading: Icon(Icons.icecream),
                  onTap: () {
                    print("dj");
                  },
                ),
                SettingsTile.switchTile(
                  title: 'Use fingerprint',
                  leading: Icon(Icons.fingerprint),
                  switchValue: true,
                  onToggle: (bool value) {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
