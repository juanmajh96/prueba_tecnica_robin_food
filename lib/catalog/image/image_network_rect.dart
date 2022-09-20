import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica/catalog/animations/animations.dart';
import 'package:prueba_tecnica/lang/lang.dart';

class ImageNetworkRect extends StatelessWidget {
  const ImageNetworkRect({
    super.key,
    this.coverId,
    required this.keyId,
  });

  final int? coverId;
  final String keyId;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      child: SizedBox(
        height: 250,
        width: 150,
        child: coverId?.let(
              (value) => Hero(
                tag: value,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: 'https://covers.openlibrary.org/b/id/$value-L.jpg',
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const ShimmerAnimation(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ) ??
            Hero(
              tag: keyId,
              child: const ColoredBox(
                color: Colors.white10,
                child: Center(
                  child: FittedBox(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Material(
                        color: Colors.transparent,
                        child: Text('Image Not Available'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
