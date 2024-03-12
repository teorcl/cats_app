import 'package:flutter/material.dart';

class DefaultImage extends StatelessWidget {
  const DefaultImage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Image.asset(
      'assets/images/default.png',
      height: 190,
      width: 180,
    );
  }
}
