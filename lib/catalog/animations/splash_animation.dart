import 'package:flutter/material.dart';

class SplashAnimation extends StatelessWidget {
  const SplashAnimation({
    super.key,
    this.duration = const Duration(milliseconds: 1000),
  });

  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 1, end: 0),
      duration: duration,
      builder: (context, value, child) => Transform.scale(
        scale: value,
        child: child,
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
