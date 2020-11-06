import 'package:flutter/material.dart';

class AppHolder extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final Function onpress;
  final Widget child;

  const AppHolder({Key key,this.height,this.width, this.color, this.onpress, this.child}) : super(key: key);

  @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onTap: onpress,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: color == null ? Colors.white.withOpacity(0.2): color,
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: child,
          ),
        ),
      );
    }
  }