import 'package:flutter/material.dart';

class AndroneBattery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 50,
      width: width,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
    );
  }
}
