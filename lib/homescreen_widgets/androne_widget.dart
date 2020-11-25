import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AndroneWidget extends StatefulWidget {
  @override
  _AndroneWidgetState createState() => _AndroneWidgetState();
}

class _AndroneWidgetState extends State<AndroneWidget> {

  TextStyle bigStyle =  TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600);
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
                IconButton(icon: Icon(FontAwesomeIcons.water,size: 30, color: Colors.white,), onPressed: null),
                Expanded(child: SizedBox()),
                IconButton(icon: Icon(FontAwesomeIcons.facebook, color: Colors.white,), onPressed: null),
                IconButton(icon: Icon(FontAwesomeIcons.whatsapp, color: Colors.white,), onPressed: null),
                IconButton(icon: Icon(FontAwesomeIcons.twitter, color: Colors.white,), onPressed: null),
                IconButton(icon: Icon(FontAwesomeIcons.instagram, color: Colors.white,), onPressed: null),

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
                      Text("Hello,",style:GoogleFonts.satisfy(color: Colors.white, fontSize: 25),),
                      SizedBox(height: 10,),
                      Text("Today's Monday,",style:GoogleFonts.satisfy(color: Colors.white, fontSize: 25),),
                      SizedBox(height: 10,),
                      Text("12 April",style: GoogleFonts.satisfy(color: Colors.white, fontSize: 25)),
                      SizedBox(height: 10,),
                      Text("2020",style:GoogleFonts.satisfy(color: Colors.white, fontSize: 25),),
                      SizedBox(height: 10,),
                      _organizer(),
                      SizedBox(height: 40,),
                      Text("Battery Charge,",style:GoogleFonts.satisfy(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),

                    ],
                  ),
                ),
              )),

              ],
            ),
          ),

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
