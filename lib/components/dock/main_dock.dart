import 'package:device_apps/device_apps.dart';
import 'package:device_apps/device_apps.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:tera_launcher/app_pages/all_apps.dart';
import 'package:tera_launcher/settings/app_config/MyAppSettings.dart';
import 'package:tera_launcher/settings/app_config/setting_page.dart';
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
    super.initState();
    AddApps();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 200,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GlassmorphicContainer(
              height: 250,
              width: 200,
              borderRadius: 20,
              blur: 100,
              alignment: Alignment.bottomCenter,
              border: 2,
              linearGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.1),
                    Color(0xFFFFFFFF).withOpacity(0.05),
                  ],
                  stops: [
                    0.1,
                    1,
                  ]),
              borderGradient: null,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: IconButton(
                            icon: Icon(
                              FeatherIcons.settings,
                              color: Colors.white,
                            ),
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => SettingPage(
                                        settings: widget.settings)))),
                      ),
                      Expanded(
                        child: IconButton(
                            icon: Icon(
                              FeatherIcons.plus,
                              color: Colors.white,
                            ),
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AllApps(settings: widget.settings)))),
                      ),
                    ],
                  ),
                  Expanded(
                    child: StaggeredGridView.countBuilder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      staggeredTileBuilder: (int index) =>
                          new StaggeredTile.count(1, index.isEven ? 1 : 1),
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                      itemCount: appsie.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DockItem(
                            app: appsie[index],
                          ),
                        );
                      },
                      crossAxisCount: 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
