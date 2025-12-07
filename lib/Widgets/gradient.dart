import 'package:flutter/material.dart';

class RadiantGradientMask extends StatelessWidget {
  RadiantGradientMask({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.topLeft,
        radius: 0.5,
        colors: [Colors.purple, Colors.lightBlue],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}