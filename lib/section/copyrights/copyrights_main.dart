import 'package:flutter/material.dart';
import 'package:my_portfolio/widget/responsive.dart';

import '../../constant/assets_color.dart';
import '../../constant/portfolio_constants.dart';

class MyCopytights extends StatelessWidget {
  const MyCopytights({super.key});
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: CopyrightMobile(),
      tablet: CopyrightTablet(),
      desktop: CopyrightDesktop(),
    );
  }
}

class CopyrightDesktop extends StatefulWidget {
  const CopyrightDesktop({super.key});

  @override
  State<CopyrightDesktop> createState() => _CopyrightDesktopState();
}

class _CopyrightDesktopState extends State<CopyrightDesktop> {
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

class CopyrightTablet extends StatefulWidget {
  const CopyrightTablet({super.key});

  @override
  State<CopyrightTablet> createState() => _CopyrightTabletState();
}

class _CopyrightTabletState extends State<CopyrightTablet> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AssetsColor.darkBlack,
        width: double.infinity,
        padding:
            const EdgeInsets.symmetric(horizontal: tabletHorizontalPadding),
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

class CopyrightMobile extends StatefulWidget {
  const CopyrightMobile({super.key});

  @override
  State<CopyrightMobile> createState() => _CopyrightMobileState();
}

class _CopyrightMobileState extends State<CopyrightMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AssetsColor.darkBlack,
        width: double.infinity,
        padding:
            const EdgeInsets.symmetric(horizontal: mobileHorizontalPadding),
        child: Column(
          children: [
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SelectableText(
                  '© Muiz ${DateTime.now().year}. All Rights Reserved.',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                const Text(
                  'Made with Flutter 💙',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )
              ],
            ),
            const SizedBox(height: 50)
          ],
        ));
  }
}
