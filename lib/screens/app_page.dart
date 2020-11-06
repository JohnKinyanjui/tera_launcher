import 'package:device_apps/device_apps.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:tera_launcher/components/app_category.dart';
import 'package:tera_launcher/components/app_gridview.dart';
import 'package:tera_launcher/components/app_holder.dart';
import 'file:///C:/Users/Jakes/My%20Projects/tera_launcher/lib/settings/app_state.dart';
import 'package:tera_launcher/settings/categories.dart';

class AppPage extends StatefulWidget {
  AppPage({Key key}) : super(key: key);

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {


  PageController controller = PageController();
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        final appsInfo = watch(appsProvider);
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              SizedBox(height: 40,),
              AppHolder(
                height: 60,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(child: SizedBox()),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: IconButton(
                        icon: Icon(FluentSystemIcons.ic_fluent_search_regular, color: Colors.white,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: IconButton(
                        icon: Icon(FluentSystemIcons.ic_fluent_store_regular, color: Colors.white,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: IconButton(
                        icon: Icon(FluentSystemIcons.ic_fluent_settings_regular, color: Colors.white,),
                      ),
                    )
                  ],
                ),
              ),
               AppCategory(
                currentPage: i == null ? 0 : i,
                onpress: (no){
                  setState(() {
                    i = no;
                  });
                  controller.animateToPage(i, duration: Duration(milliseconds: 500), curve: Curves.ease);
                },
              ),
              Expanded(
                child: appsInfo.when(
                    data: (List<Application> apps) => PageView.builder(
                      itemCount: 9,
                        controller: controller,
                        onPageChanged: (page){
                          setState(() {
                            i = page;
                          });
                        },
                        itemBuilder: (context, index){
                          return SingleChildScrollView(
                            child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20.0, top: 8),
                                      child: Row(
                                        children: [
                                          Text("${getCategoryLabel(index)}", style: GoogleFonts.raleway(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900)),
                                        ],
                                      ),
                                    ),
                                    Center(
                                      child: AppHolder(
                                        child: AppGridview(
                                          appCategory: getCategory(index),
                                          apps: apps,
                                        ),
                                      ),
                                    ),
                                  ],
                            ),
                          );
                        }
                    ),
                    loading: () =>  Center(
                      child: Loading(indicator: BallPulseIndicator(), size: 25.0),
                    ),
                    error: (err, trace) => Text(err.toString())
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}

