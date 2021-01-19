import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinity_ui/infinity_ui.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:tera_launcher/settings/app_config/MyAppSettings.dart';
import 'package:tera_launcher/settings/pages/icons/icon_setting_page.dart';

class SettingPage extends ConsumerWidget {
  final MyAppSettings settings;

  const SettingPage({Key key, this.settings});
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return SafeInfinityUi(
      background: Container(color: Colors.blue),
      navigationBarBackground: Container(color: Colors.blue),
      statusBarBackground: Container(color: Colors.blue),
      child: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Settings',
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
                    title: 'Home Screen Widget',
                    subtitle: 'English',
                    leading: Icon(Icons.language),
                    onPressed: (context) {}),
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
                  onPressed: (ctx) => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => IconSettingPage())),
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
