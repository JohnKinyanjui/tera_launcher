import 'dart:typed_data';

import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:tera_launcher/components/app_item.dart';
import 'package:tera_launcher/components/search_component.dart';
import 'package:tera_launcher/settings/MyAppSettings.dart';
import 'package:tera_launcher/settings/app_state.dart';

class AllApps extends StatefulWidget {
  final MyAppSettings settings;
  AllApps({Key key, this.settings}) : super(key: key);

  @override
  _AllAppsState createState() => _AllAppsState();
}

class _AllAppsState extends State<AllApps> {

  List<String> selected_apps = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text("Select Application"),
          automaticallyImplyLeading: false,
          leadingWidth: 0,
          actions: [
            Center(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${selected_apps.length}/10"),
            )),
          ],
        ),
        body: Consumer(builder: (context, watch, _) {
          final appsInfo = watch(appsProvider);
          Uint8List icon;

          return appsInfo.when(
              data: (List<Application> apps) => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: apps.length,
                          itemBuilder: (BuildContext context, int index) {
                            ApplicationWithIcon iconApp = apps[index];
                             icon = iconApp.icon;
                            return CheckboxListTile(
                              secondary: Container(
                                height: 40,
                                  width: 40,
                                  child: Image.memory(icon)),
                              title: Text(apps[index].appName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              subtitle: Text(apps[index].packageName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 10),),
                              checkColor: Colors.white,
                              selected: selected_apps.contains(apps[index].packageName),
                              onChanged: (i){
                                if(i== true){
                                  setState(() {
                                    selected_apps.add(apps[index].packageName);
                                  });
                                }else{
                                  setState(() {
                                    selected_apps.remove(apps[index].packageName);
                                  });
                                }
                              }, value: selected_apps.contains(apps[index].packageName) == true ? true : false
                            );
                          },
                        ),
                      ),
                    ],
                  ),
              loading: () => Center(
                    child: Loading(indicator: BallPulseIndicator(), size: 25.0),
                  ),
              error: (err, trace) => Text(err.toString()));
        }),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.save_outlined, color: Colors.white,),
            backgroundColor: Colors.deepPurpleAccent,
            onPressed: () {
            widget.settings.DockApps.clear();
            widget.settings.DockApps.setValue(selected_apps);
            Navigator.of(context).pop();
          }),
    );
  }
}
