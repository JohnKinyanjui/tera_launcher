import 'dart:ui';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:tera_launcher/components/app_holder.dart';
import 'launcher_home.dart';
import 'launcher_options.dart';

class Launcher extends StatefulWidget {
  @override
  _LauncherState createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      drawerScrimColor: Colors.transparent,
     backgroundColor: Colors.transparent,
       body: Column(
         children: [
           Expanded(
             child: PageView(
               children: [
                 LauncherHome(),
                 LauncherOptions(),

               ],
             ),
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child:  Container(
               height: 100,
               width: double.infinity,
               decoration: BoxDecoration(
                 color: Colors.black.withOpacity(0.2),
                 borderRadius: BorderRadius.all(Radius.circular(20))
               ),
               child: Center(
                 child: Container(
                   height: 60,
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.stretch,
                     children: [
                       Expanded(child: SizedBox()),
                       AppHolder(
                         height: 50,
                         width: 50,
                         color: Colors.white.withOpacity(0.1),
                         child: Center(child: Icon(FeatherIcons.phoneCall, color: Colors.white,)),
                       ),
                       AppHolder(
                         height: 50,
                         width: 50,
                         color: Colors.white.withOpacity(0.1),
                         child: Center(child: Icon(FeatherIcons.messageSquare, color: Colors.white,)),
                       ),
                       AppHolder(
                         height: 50,
                         width: 50,
                         color: Colors.white.withOpacity(0.1),
                         child: Center(child: Icon(FluentSystemIcons.ic_fluent_apps_regular, color: Colors.white,)),
                       ),
                       AppHolder(
                         height: 50,
                         width: 50,
                         color: Colors.white.withOpacity(0.1),
                         child: Center(child: Icon(FluentSystemIcons.ic_fluent_apps_regular, color: Colors.white,)),

                       ),
                       AppHolder(
                         height: 50,
                         width: 50,
                         color: Colors.white.withOpacity(0.1),
                       ),
                       Expanded(child: SizedBox()),

                     ],
                   ),
                 ),
               ),
             ),
           ),
         ],
       ),
       drawer: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
       child: Container(
         height: height,
         width: 300,
         color: Colors.white.withOpacity(0.2),
         child: Column(
           children: [


           ],
         ),
       ),
     ),
    );
  }
}
