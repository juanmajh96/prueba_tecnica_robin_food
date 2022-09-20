import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingIndicatorAnimation(
            duration: const Duration(milliseconds: 800),
            widget: Container(
              height: 20,
              width: 20,
              color: Colors.white,
            ),
          ),
          LoadingIndicatorAnimation(
            duration: const Duration(milliseconds: 850),
            widget: Container(
              height: 20,
              width: 20,
              color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          LoadingIndicatorAnimation(
            duration: const Duration(milliseconds: 950),
            widget: Container(
              height: 20,
              width: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class LoadingIndicatorAnimation extends StatefulWidget {
  const LoadingIndicatorAnimation({
    super.key,
    required this.duration,
    required this.widget,
  });

  final Duration duration;
  final Widget widget;

  @override
  State<LoadingIndicatorAnimation> createState() =>
      _LoadingIndicatorAnimationState();
}

class _LoadingIndicatorAnimationState extends State<LoadingIndicatorAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late Animation<double> _opacity;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true);
    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 1),
      ),
    );
    _animation = Tween<double>(begin: 0, end: 50).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: Opacity(
            opacity: _opacity.value,
            child: widget.widget,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController
      ..stop()
      ..dispose();
    super.dispose();
  }
}
