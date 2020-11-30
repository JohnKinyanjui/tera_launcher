import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';

class AndroneClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnalogClock(
            decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.white),
                color: Colors.transparent,
                shape: BoxShape.circle),
            width: 150.0,
            isLive: true,
            hourHandColor: Colors.white,
            minuteHandColor: Colors.white,
            showSecondHand: true,
            numberColor: Colors.black,
            showNumbers: true,
            textScaleFactor: 1.4,
            showTicks: true,
            tickColor: Colors.black,
            showDigitalClock: false,
            datetime: DateTime(2019, 1, 1, 9, 12, 15),
          );
  }
}
