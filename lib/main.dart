import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:tera_launcher/main_page.dart';
import 'package:tera_launcher/settings/MyAppSettings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent.withOpacity(0.01),
    statusBarBrightness: Brightness.dark,
    systemNavigationBarDividerColor: Colors.transparent,
  ));
  final preferences = await StreamingSharedPreferences.instance;
  final settings = MyAppSettings(preferences);
  runApp(MyApp(settings: settings,));
}

class MyApp extends StatelessWidget {
  final MyAppSettings settings;

  const MyApp({Key key, this.settings}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MainPage(
          settings: settings,
        ),
      ),
    );
  }
}
