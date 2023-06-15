import 'package:flutter/material.dart';

import '../../constant/assets_color.dart';
import '../../constant/portfolio_constants.dart';
import '../../widget/mini_title.dart';
import '../../widget/text_title.dart';

class MyProject extends StatelessWidget {
  const MyProject({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      color: AssetsColor.darkBlack,
      padding: const EdgeInsets.symmetric(
          horizontal: desktopHorizontalPadding, vertical: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MiniTitle(text: 'Projects'),
          const TextTitle(text: 'Selected Project'),
          const SizedBox(height: 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  4,
                  (index) => Container(
                        height: size.width * 0.15,
                        width: size.width * 0.15,
                        color: AssetsColor.lyeLight,
                      ))),
        ],
      ),
    );
  }
}
