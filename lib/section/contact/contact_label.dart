import 'package:flutter/material.dart';

import '../../core/constant/assets_color.dart';

class LabelAboutMe extends StatelessWidget {
  final String title;
  final String sub1;
  final String sub2;
  final double fontSize;
  const LabelAboutMe(
      {super.key,
      required this.title,
      required this.sub1,
      required this.sub2,
      this.fontSize = 18});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(color: AssetsColor.orangeAmber, fontSize: 52),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sub1,
              style:
                  TextStyle(color: AssetsColor.whiteMatte, fontSize: fontSize),
            ),
            Text(
              sub2,
              style:
                  TextStyle(color: AssetsColor.whiteMatte, fontSize: fontSize),
            ),
          ],
        ),
      ],
    );
  }
}
