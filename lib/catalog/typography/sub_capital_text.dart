import 'package:flutter/material.dart';
import 'package:prueba_tecnica/catalog/sizes/sizes.dart';

class SubCapitalText extends StatelessWidget {
  const SubCapitalText({super.key, required this.text, this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
        fontStyle: FontStyle.normal,
        fontSize: Dimens.h1TitleText,
      ),
      textAlign: TextAlign.center,
    );
  }
}
