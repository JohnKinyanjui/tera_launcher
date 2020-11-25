import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';


class MyAppSettings {
  MyAppSettings(StreamingSharedPreferences preferences)
        : DockApps = preferences.getStringList('DockApps', defaultValue: []);


  final Preference<List> DockApps;


}