import 'package:college_project/view/const/color.dart';
import 'package:flutter/material.dart';

ShaderMask shading_color(Widget child) {
  return ShaderMask(
    shaderCallback: (Rect bounds) => RadialGradient(
      center: Alignment.bottomRight,
      stops: [.3, 1],
      colors: [colorPallateright, colorPallateleft],
      tileMode: TileMode.mirror,
    ).createShader(bounds),
    child: child,
  );
}
