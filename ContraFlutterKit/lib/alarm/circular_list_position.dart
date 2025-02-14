import 'dart:math';

import 'package:flutter/material.dart';

class CircularPosition extends StatefulWidget {
  final double radius;
  final double angle;
  final Widget child;

  const CircularPosition({super.key, 
    required this.angle,
    required this.child,
    required this.radius,
  });

  @override
  CircularPositionState createState() {
    return CircularPositionState();
  }
}

class CircularPositionState extends State<CircularPosition> {
  @override
  Widget build(BuildContext context) {
    final x = cos(widget.angle) * widget.radius;
    final y = sin(widget.angle) * widget.radius;

    return Transform(
      transform: Matrix4.translationValues(x, y, 0.0),
      child: widget.child,
    );
  }
}
