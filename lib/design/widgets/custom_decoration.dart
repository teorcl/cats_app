import 'package:flutter/material.dart';

class CustomDecoration {
  static final decoration = BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    border: Border.all(
      color: Colors.grey,
      width: 1,
    ),
  );

  static final outlineInputBorder = UnderlineInputBorder(
    borderSide: const BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.circular(16),
  );
}