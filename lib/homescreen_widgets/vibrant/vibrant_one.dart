import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tera_launcher/settings/handlers/app_handler.dart';

class ConfigStyles {
  TextStyle vibrantOneHuge = GoogleFonts.abel();
}

class VibrantOne extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: SizedBox()),
          Center(
            child: Container(
              height: 220,
              width: 230,
              decoration: BoxDecoration(
                  color: Colors.grey[900].withOpacity(0.2),
                  border: Border.all(color: Colors.white, width: 0.5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('11:10 PM',
                      style: TextStyle(
                          fontFamily: 'procrasting',
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 50)),
                  Text('11 May 2020',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'procrasting',
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
            ),
          ),
          Expanded(child: SizedBox()),
          SizedBox(height: 60)
        ],
      ),
    );
  }
}
