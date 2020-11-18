import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:tera_launcher/components/app_item.dart';
import 'package:tera_launcher/components/search_component.dart';
import 'package:tera_launcher/settings/app_state.dart';

class AllApps extends StatefulWidget {
  AllApps({Key key}) : super(key: key);

  @override
  _AllAppsState createState() => _AllAppsState();
}

class _AllAppsState extends State<AllApps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Consumer(
          builder: (context, watch, _) {
            final appsInfo = watch(appsProvider);
            return appsInfo.when(
                data: (List<Application> apps) =>
                    Column(
                        children: [
                          SizedBox(height: 40,),
                          SearchComponent(),
                          Expanded(
                            child: GridView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4),
                                itemCount: apps.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return AppItem(
                                    app: apps[index],
                                  );
                                },
                              ),
                          ),
                        ],
                      ),
                loading: () =>
                    Center(
                      child: Loading(
                          indicator: BallPulseIndicator(), size: 25.0),
                    ),
                error: (err, trace) => Text(err.toString()));
          })
    );
  }
}