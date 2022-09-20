import 'package:flutter/material.dart';

class ShimmerAnimation extends StatelessWidget {
  const ShimmerAnimation({
    super.key,
    this.height = 30,
    this.width = 200,
    this.color = Colors.grey,
    this.borderRadius = 0,
    this.padding,
    this.margin,
  });

  final double height;
  final double width;
  final Color color;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    var _end = 1.0;
    return StatefulBuilder(
      builder: (_, void Function(void Function()) update) {
        return TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 850),
          tween: Tween<double>(begin: 0, end: _end),
          onEnd: () {
            update(() {
              _end = _end == 0.0 ? 1.0 : 0.0;
            });
          },
          builder: (_, double value, __) {
            return Container(
              padding: padding,
              margin: margin,
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                gradient: LinearGradient(
                  colors: <Color>[
                    color.withOpacity(0.1),
                    color.withOpacity(0.3),
                    color,
                    color.withOpacity(0.3),
                    color.withOpacity(0.1),
                  ],
                  stops: <double>[
                    0,
                    value,
                    value,
                    value,
                    1,
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
