import 'package:flutter/material.dart';

class FadeTransitionAlt extends StatefulWidget {
  final Curve curve;
  final Widget child;

  const FadeTransitionAlt({Key key, this.curve, this.child}) : super(key: key);
  @override
  _FadeTransitionAltState createState() => _FadeTransitionAltState();
}

class _FadeTransitionAltState extends State<FadeTransitionAlt>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this, value: 0.1);
    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);

    _controller.forward();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
