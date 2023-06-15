import 'package:flutter/material.dart';

class MiniTitle extends StatelessWidget {
  final String text;
  final double fontSize;
  const MiniTitle({super.key, required this.text, this.fontSize = 24});
  @override
  Widget build(BuildContext context) {
    return Text(
      ' - $text',
      style: TextStyle(
          color: Colors.white54,
          fontSize: fontSize,
          fontWeight: FontWeight.w200),
    );
  }
}
