import 'package:flutter/material.dart';

import '../core/constant/assets_color.dart';

class TextTitle extends StatelessWidget {
  final String text;
  final double fontSize;
  const TextTitle({super.key, required this.text, this.fontSize = 34});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: fontSize,
          color: AssetsColor.whiteMatte),
    );
  }
}
