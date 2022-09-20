import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MultipleValueListenableBuilder<A, B, C> extends StatelessWidget {
  const MultipleValueListenableBuilder({
    super.key,
    this.child,
    required this.first,
    required this.second,
    required this.third,
    required this.builder,
  });

  final ValueListenable<A> first;
  final ValueListenable<B> second;
  final ValueListenable<C> third;
  final Widget? child;
  final Widget Function(BuildContext, A, B, C, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<A>(
      valueListenable: first,
      builder: (_, a, __) {
        return ValueListenableBuilder<B>(
          valueListenable: second,
          builder: (_, b, __) {
            return ValueListenableBuilder<C>(
              valueListenable: third,
              builder: (context, c, ___) {
                return builder(context, a, b, c, child);
              },
            );
          },
        );
      },
    );
  }
}
