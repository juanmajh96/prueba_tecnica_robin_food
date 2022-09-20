import 'package:flutter/material.dart';
import 'package:prueba_tecnica/catalog/typography/typography.dart';

class IsErrorWidget extends StatelessWidget {
  const IsErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: TitleText(text: 'Error'),
    );
  }
}
