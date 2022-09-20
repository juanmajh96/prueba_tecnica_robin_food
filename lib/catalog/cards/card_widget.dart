import 'package:flutter/material.dart';
import 'package:prueba_tecnica/catalog/image/image.dart';
import 'package:prueba_tecnica/catalog/typography/typography.dart';
import 'package:prueba_tecnica/domain/entities/result/result.dart';
import 'package:prueba_tecnica/lang/lang.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.dataEntity});

  final DataEntity dataEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.transparent,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          ImageNetworkRect(
            keyId: dataEntity.key,
            coverId: dataEntity.coverId,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: dataEntity.title?.let(
                          (value) => TitleText(text: value),
                        ) ??
                        const SizedBox(),
                  ),
                  dataEntity.author?.let(
                        (value) => RowInfoText(
                          infoText: 'Author',
                          descriptionText: value.first,
                        ),
                      ) ??
                      const SizedBox(),
                  const SizedBox(height: 5),
                  dataEntity.editionCount?.let(
                        (value) => RowInfoText(
                          infoText: 'Total Edition',
                          descriptionText: value.toString(),
                        ),
                      ) ??
                      const SizedBox(),
                  const SizedBox(height: 5),
                  dataEntity.firstPublisherYear?.let(
                        (value) => RowInfoText(
                          infoText: 'First Publish year',
                          descriptionText: value.toString(),
                        ),
                      ) ??
                      const SizedBox(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
