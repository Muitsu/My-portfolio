import 'package:flutter/material.dart';

import '../../constant/assets_color.dart';

class LabelAboutMe extends StatelessWidget {
  final String title;
  final String sub1;
  final String sub2;
  const LabelAboutMe(
      {super.key, required this.title, required this.sub1, required this.sub2});

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
                  const TextStyle(color: AssetsColor.whiteMatte, fontSize: 18),
            ),
            Text(
              sub2,
              style:
                  const TextStyle(color: AssetsColor.whiteMatte, fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }
}
