import 'package:flutter/material.dart';
import 'package:prueba_tecnica/catalog/sizes/sizes.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
        fontSize: Dimens.h1TitleText,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
