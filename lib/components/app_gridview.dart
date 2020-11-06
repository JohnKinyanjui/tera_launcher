import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:tera_launcher/components/app_category.dart';
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

  void get_apps(){
   print("gettings apps");
    for(int i =0; i<widget.apps.length; i++){
      print("Appname ${widget.apps[i].appName} AppCategory ${widget.apps[i].category}" );
      if (widget.apps[i].category == widget.appCategory) {
        setState(() {
          all_apps.add(widget.apps[i]);
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_apps();
  }
  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      shrinkWrap: true,
      physics:const NeverScrollableScrollPhysics() ,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemCount: all_apps.length,
      itemBuilder: (BuildContext context, int index) {
        return AppItem(
         app: all_apps[index],

        );
      },);
  }
}