import 'package:device_apps/device_apps.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:tera_launcher/settings/MyAppSettings.dart';
import 'package:tera_launcher/settings/app_state.dart';

import '../app_item.dart';
import 'dock_item.dart';

class MainDock extends StatefulWidget {
  final MyAppSettings settings;

  const MainDock({Key key, this.settings}) : super(key: key);
  @override
  _MainDockState createState() => _MainDockState();
}

class _MainDockState extends State<MainDock> {
  List<Application> appsie = [];

  Future<Application> getApp(packageName) async {
    Application app = await DeviceApps.getApp(packageName);

    return app;
  }

  void AddApps() async {
    List<String> apps = widget.settings.DockApps.getValue();
    print(apps.length.toString());
    for (int i = 0; i < apps.length; i++) {
      Application cApp = await DeviceApps.getApp(apps[i], true);
      setState(() {
        appsie.add(cApp);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AddApps();
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: appsie.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: DockItem(
                      app: appsie[index],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
