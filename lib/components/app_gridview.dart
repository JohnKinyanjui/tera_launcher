import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:popup_menu/popup_menu.dart';
import 'package:tera_launcher/anim/fade_transition_alt.dart';
import 'package:tera_launcher/components/app_item.dart';

class AppGridview extends StatefulWidget {
  final List<Application> apps;
  final ApplicationCategory appCategory;

  AppGridview({Key key, this.apps, this.appCategory}) : super(key: key);

  @override
  _AppGridviewState createState() => _AppGridviewState();
}

class _AppGridviewState extends State<AppGridview> {
  List<Application> all_apps = [];
  List<Application> social_apps = [];
  List<Application> productivity_apps = [];
  List<Application> games_apps = [];
  List<Application> images_apps = [];
  List<Application> videos_apps = [];
  List<Application> audios_apps = [];
  List<Application> maps_apps = [];
  List<Application> news_apps = [];
  List<Application> other_apps = [];
  void get_apps() {
    for (int i = 0; i < widget.apps.length; i++) {
      if (widget.apps[i].packageName == "com.android.contacts") {
        
        social_apps.add(widget.apps[i]);
      } else if (widget.apps[i].appName == "Phone") {
        social_apps.add(widget.apps[i]);
      } else if (widget.apps[i].packageName == "com.google.android.apps.maps") {
        maps_apps.add(widget.apps[i]);
      } else if (widget.apps[i].packageName == "com.google.earth") {
        maps_apps.add(widget.apps[i]);
      } else if (widget.apps[i].category == ApplicationCategory.social) {
        social_apps.add(widget.apps[i]);
      } else if (widget.apps[i].category == ApplicationCategory.productivity) {
        productivity_apps.add(widget.apps[i]);
      } else if (widget.apps[i].category == ApplicationCategory.game) {
        games_apps.add(widget.apps[i]);
      } else if (widget.apps[i].category == ApplicationCategory.image) {
        images_apps.add(widget.apps[i]);
      } else if (widget.apps[i].category == ApplicationCategory.video) {
        videos_apps.add(widget.apps[i]);
      } else if (widget.apps[i].category == ApplicationCategory.audio) {
        audios_apps.add(widget.apps[i]);
      } else if (widget.apps[i].category == ApplicationCategory.maps) {
        maps_apps.add(widget.apps[i]);
      } else if (widget.apps[i].category == ApplicationCategory.news) {
        news_apps.add(widget.apps[i]);
      } else if (widget.apps[i].category == ApplicationCategory.undefined) {
        other_apps.add(widget.apps[i]);
      }
    }
  }

  List<Application> getApplications(ApplicationCategory category) {
    if (category == ApplicationCategory.social) {
      return social_apps;
    } else if (category == ApplicationCategory.productivity) {
      return productivity_apps;
    } else if (category == ApplicationCategory.game) {
      return games_apps;
    } else if (category == ApplicationCategory.image) {
      return images_apps;
    } else if (category == ApplicationCategory.video) {
      return videos_apps;
    } else if (category == ApplicationCategory.audio) {
      return audios_apps;
    } else if (category == ApplicationCategory.maps) {
      return maps_apps;
    } else if (category == ApplicationCategory.news) {
      return news_apps;
    } else if (category == ApplicationCategory.undefined) {
      return other_apps;
    }
  }

  @override
  void initState() {
    super.initState();
    get_apps();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey btnKey2 = GlobalKey();

    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(1, index.isEven ? 1 : 1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      itemCount: getApplications(widget.appCategory).length,
      itemBuilder: (BuildContext context, int index) {
        return FadeTransitionAlt(
          curve: Curves.easeIn,
          child: AppItem(
            onpress: () => DeviceApps.openApp(
                getApplications(widget.appCategory)[index].packageName),
            app: getApplications(widget.appCategory)[index],
          ),
        );
      },
      crossAxisCount: 4,
    );
  }
}
