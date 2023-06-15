import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;
  const Responsive(
      {super.key, required this.mobile, this.tablet, required this.desktop});

  // static bool isMobile(BuildContext context) =>
  //     MediaQuery.of(context).size.width < 850;
  // static bool isTablet(BuildContext context) =>
  //     MediaQuery.of(context).size.width < 1100 &&
  //     MediaQuery.of(context).size.width >= 850;

  // static bool isDesktop(BuildContext context) =>
  //     MediaQuery.of(context).size.width >= 1100;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      debugPrint(constraints.maxWidth.toString());
      if (constraints.maxWidth < 850) {
        debugPrint('mobile');
        return mobile;
      } else if ((constraints.maxWidth < 1150 &&
          constraints.maxWidth >= 850 &&
          tablet != null)) {
        debugPrint('tablet');
        return tablet!;
      }
      debugPrint('desktop');

      return desktop;
    });
  }
}
