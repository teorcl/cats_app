import 'package:cats_app/design/widgets/default_image.dart';
import 'package:flutter/material.dart';

class CatImage extends StatelessWidget {

  final String imageUrl;

  const CatImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: double.infinity,
      child: Image.network(
        fit: BoxFit.cover,
        imageUrl,
        errorBuilder: (context, _, stackTrace) {
          return const DefaultImage();
        },
      ),
    );
  }
}
