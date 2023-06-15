import 'package:flutter/material.dart';

import '../../constant/assets_color.dart';
import '../../constant/portfolio_constants.dart';

class MyCopytights extends StatelessWidget {
  const MyCopytights({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AssetsColor.darkBlack,
        width: double.infinity,
        padding:
            const EdgeInsets.symmetric(horizontal: desktopHorizontalPadding),
        child: Column(
          children: [
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SelectableText(
                  '© Muiz ${DateTime.now().year}. All Rights Reserved.',
                  style: const TextStyle(color: Colors.white),
                ),
                const Text(
                  'Made with Flutter 💙',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            const SizedBox(height: 50)
          ],
        ));
  }
}
