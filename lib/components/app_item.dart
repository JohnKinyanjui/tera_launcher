import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tera_launcher/components/app_holder.dart';

class AppItem extends StatelessWidget {
  final ApplicationWithIcon app;

  const AppItem({Key key, this.app,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> DeviceApps.openApp(app.packageName),
      child: Column(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                image: DecorationImage(image: MemoryImage(app.icon), fit: BoxFit.cover)
            ),
          ),
          SizedBox(height: 5,),
          Text(app.appName, style: GoogleFonts.firaMono(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 10),textAlign: TextAlign.center,),
          // Text(app.appName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 10),textAlign: TextAlign.center,)

        ],
      ),
    );
  }
}




