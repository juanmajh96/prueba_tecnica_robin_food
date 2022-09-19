import 'package:flutter/material.dart';
import 'package:prueba_tecnica/catalog/sizes/sizes.dart';

class CapitalText extends StatelessWidget {
  const CapitalText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: 'Roboto',
        fontStyle: FontStyle.normal,
        fontSize: Dimens.capitalText,
      ),
      textAlign: TextAlign.center,
    );
  }
}
