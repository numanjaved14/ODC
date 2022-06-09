import 'package:flutter/material.dart';

class GradientCreate extends StatelessWidget {
  GradientCreate({required this.child});

  final Gradient _green_gradient =
      const LinearGradient(colors: [Color(0xff7CFC00), Color(0xff98FB98)]);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return _green_gradient.createShader(Offset.zero & bounds.size);
      },

      ///create the child color white to apply gradient
      child: child,
    );
  }
}
