import 'dart:math' show sqrt, max;
import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

class BouncyPageAnimation extends PageRouteBuilder<Widget> {
  BouncyPageAnimation({
    required this.widget,
  }) : super(
          transitionDuration: const Duration(milliseconds: 800),
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) =>
              ClipPath(
            clipper: CircularRevealClipper(
              fraction: animation.value,
              centerAlignment: Alignment.center,
            ),
            child: child,
          ),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              widget,
        );
  final Widget widget;
}

@immutable
class CircularRevealClipper extends CustomClipper<Path> {
  const CircularRevealClipper({
    required this.fraction,
    this.centerAlignment,
    this.centerOffset,
    this.minRadius,
    this.maxRadius,
  });
  final double fraction;
  final Alignment? centerAlignment;
  final Offset? centerOffset;
  final double? minRadius;
  final double? maxRadius;

  @override
  Path getClip(Size size) {
    final center = centerAlignment?.alongSize(size) ??
        centerOffset ??
        Offset(size.width / 2, size.height / 2);
    final minRadius = this.minRadius ?? 0;
    final maxRadius = this.maxRadius ?? calcMaxRadius(size, center);

    return Path()
      ..addOval(
        Rect.fromCircle(
          center: center,
          radius: lerpDouble(minRadius, maxRadius, fraction)!,
        ),
      );
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

  static double calcMaxRadius(Size size, Offset center) {
    final w = max(center.dx, size.width - center.dx);
    final h = max(center.dy, size.height - center.dy);
    return sqrt(w * w + h * h);
  }
}
