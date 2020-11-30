import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AndroneBattery extends StatelessWidget {
  final int batteryLevel;

  const AndroneBattery({Key key, this.batteryLevel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width/2;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.white, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Row(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 3000),
                height: 50,
                width: width * batteryLevel/100,
                decoration: BoxDecoration(
                color: getBatteryColor(batteryLevel),
                borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Center(child: Text("${batteryLevel.toString()} %", style: GoogleFonts.varela(color: Colors.white, fontWeight: FontWeight.w400),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Color getBatteryColor(int batteryLevel){
  if(batteryLevel < 25){
    return Colors.red;
  }else if (batteryLevel > 25){
    return Colors.orange;
  }else if(batteryLevel > 50){
    return Colors.green;
  }
}