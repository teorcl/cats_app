import 'package:cats_app/design/widgets/custom_decoration.dart';
import 'package:cats_app/design/widgets/default_image.dart';
import 'package:cats_app/design/widgets/v_space.dart';
import 'package:flutter/material.dart';

class CatCard extends StatelessWidget {

  final String countryOrigin;
  final int intelligence;
  final String imageUrl;
  final String nameBreed;

  const CatCard({
    super.key,
    required this.countryOrigin,
    required this.intelligence,
    required this.imageUrl,
    required this.nameBreed,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.85,
      height: 300,
      decoration: CustomDecoration.decoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const VSpace(),
          Text(
            nameBreed,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const VSpace(),
          Image.network(
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
            imageUrl,
            errorBuilder: (context, _, stackTrace) {
              return const DefaultImage();
            },
          ),
          const VSpace(),
          Text("Origin: $countryOrigin   Intelligence: $intelligence"),
          const VSpace(),
        ],
      ),
    );
  }
}
