import 'package:flutter/material.dart';
import 'package:prueba_tecnica/catalog/sizes/sizes.dart';

class RowInfoText extends StatelessWidget {
  const RowInfoText({
    super.key,
    required this.infoText,
    required this.descriptionText,
  });

  final String infoText;
  final String descriptionText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$infoText: ',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: Dimens.bodyText,
            fontWeight: FontWeight.bold,
          ),
        ),
        Flexible(
          child: FittedBox(
            child: Text(
              descriptionText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: Dimens.legalText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
