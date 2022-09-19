import 'package:flutter/material.dart';

class FadeDownAnimation extends StatelessWidget {
  const FadeDownAnimation({
    super.key,
    required this.childWidget,
    this.durationTransform = const Duration(seconds: 1),
    this.durationOpacity = const Duration(seconds: 2),
  });

  final Widget childWidget;
  final Duration durationTransform;
  final Duration durationOpacity;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Offset>(
      tween: Tween<Offset>(begin: const Offset(0, -100), end: Offset.zero),
      duration: durationTransform,
      child: childWidget,
      builder: (context, value, child) => Transform.translate(
        offset: value,
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: 1),
          duration: durationOpacity,
          builder: (context, value, _) => Opacity(
            opacity: value,
            child: child,
          ),
        ),
      ),
    );
  }
}
