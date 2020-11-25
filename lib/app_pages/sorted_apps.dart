import 'dart:ui';

import 'package:device_apps/device_apps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:tera_launcher/components/app_category.dart';
import 'package:tera_launcher/components/app_gridview.dart';
import 'package:tera_launcher/components/app_holder.dart';
import 'package:tera_launcher/components/search_component.dart';
import 'package:tera_launcher/settings/MyAppSettings.dart';
import 'package:tera_launcher/settings/app_state.dart';
import 'package:tera_launcher/settings/categories.dart';

class SortedApps extends StatefulWidget {
  final MyAppSettings settings;
  SortedApps({Key key, this.settings}) : super(key: key);

  @override
  _SortedAppsState createState() => _SortedAppsState();
}

class _SortedAppsState extends State<SortedApps> {
  PageController controller = PageController();
  int i = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, _) {
      final appsInfo = watch(appsProvider);
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                SearchComponent(settings: widget.settings,),
                AppCategory(
                  currentPage: i == null ? 0 : i,
                  onpress: (no) {
                    setState(() {
                      i = no;
                    });
                    controller.animateToPage(i,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  },
                ),
                Expanded(
                  child: appsInfo.when(
                      data: (List<Application> apps) => PageView.builder(
                          itemCount: 9,
                          controller: controller,
                          onPageChanged: (page) {
                            setState(() {
                              i = page;
                            });
                          },
                          itemBuilder: (context, index) {
                            return SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, top: 8),
                                    child: Row(
                                      children: [
                                        Text("${getCategoryLabel(index)}",
                                            style: GoogleFonts.josefinSans(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w900)),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: AppHolder(
                                      color: Colors.transparent,
                                      child: AppGridview(
                                        appCategory: getCategory(index),
                                        apps: apps,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                      loading: () => Center(
                            child: Loading(
                                indicator: BallPulseIndicator(), size: 25.0),
                          ),
                      error: (err, trace) => Text(err.toString())),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
