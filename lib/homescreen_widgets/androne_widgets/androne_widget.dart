import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tera_launcher/homescreen_widgets/androne_widgets/androne_clock.dart';
import 'androne_battery.dart';

class AndroneWidget extends StatefulWidget {
  @override
  _AndroneWidgetState createState() => _AndroneWidgetState();
}

class _AndroneWidgetState extends State<AndroneWidget> {
  String batteryLevel = "";
  TextStyle bigStyle =  TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600);

  Stream<AndroidBatteryInfo> getBatteryInfo(){
    return BatteryInfoPlugin().androidBatteryInfoStream;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(child: SizedBox()),
                IconButton(icon: Icon(FontAwesomeIcons.facebook, color: Colors.blue[900],), onPressed: null),
                IconButton(icon: Icon(FontAwesomeIcons.whatsapp, color: Colors.green,), onPressed: null),
                IconButton(icon: Icon(FontAwesomeIcons.twitter, color: Colors.blue,), onPressed: null),
                IconButton(icon: Icon(FontAwesomeIcons.instagram, color: Colors.red,), onPressed: null),
                Expanded(child: SizedBox()),

              ],
            ),
          ),
         Expanded(child: AndroneClock()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Battery Level",style: GoogleFonts.varelaRound(color: Colors.white, fontWeight: FontWeight.w600),),
          ),

          StreamBuilder<AndroidBatteryInfo>(
           stream:BatteryInfoPlugin().androidBatteryInfoStream,
             builder: (ctx,snapshot){
             return  AndroneBattery(batteryLevel: snapshot.data.batteryLevel,);

         })
        ],
      ),
    );
  }
}
