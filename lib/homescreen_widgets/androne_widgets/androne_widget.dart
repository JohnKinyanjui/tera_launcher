import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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
          Expanded(
            child: Row(
              children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30,),
                      _organizer(),
                      SizedBox(height: 10,),
                      Text("Hello,",style:GoogleFonts.varela(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),),
                      SizedBox(height: 10,),
                      Text("Today's Monday,",style:GoogleFonts.varela(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),),
                      SizedBox(height: 10,),
                      Text("12 April",style: GoogleFonts.varela(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
                      SizedBox(height: 10,),
                      Text("2020",style:GoogleFonts.varela(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),),
                      SizedBox(height: 10,),
                      _organizer(),
                      SizedBox(height: 40,),
                      Text("Battery Charge,",style:GoogleFonts.varela(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),

                    ],
                  ),
                ),
              )),

              ],
            ),
          ),
         StreamBuilder<AndroidBatteryInfo>(
           stream:BatteryInfoPlugin().androidBatteryInfoStream,
             builder: (ctx,snapshot){
             return Text("${snapshot.data.batteryLevel == null ? "0" :snapshot.data.batteryLevel }");

         })
        ],
      ),
    );
  }
}

Widget _organizer(){
  return Padding(
    padding: const EdgeInsets.all(0),
    child: Container(
      height: 5,
      width: 100,
      decoration: BoxDecoration(color: Colors.white,),),
  );
}

Widget _batteryLevel(double width, batteryLevel){
  return AnimatedContainer(
      width: width,
      height: 20,
      duration: Duration(milliseconds: 3000),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 3000),
        width: width * batteryLevel/100,
  ),
  );
}

Color getBatteryColor(){}