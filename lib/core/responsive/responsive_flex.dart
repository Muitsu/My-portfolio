import 'package:flutter/material.dart';
import '../responsive/responsive.dart';

class ResponsiveFlex extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final bool isDesktopReverse;
  final bool isMobileReverse;
  const ResponsiveFlex({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.spacing = 16,
    this.isDesktopReverse = false,
    this.isMobileReverse = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    // 1. Apply the padding to all children first
    var processedChildren = children
        .map((child) => Padding(
              padding: EdgeInsets.all(spacing / 2),
              child: child,
            ))
        .toList();

    // 2. isDesktopReverse the list if the flag is true
    return Flex(
      direction: isDesktop ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: isDesktop
          ? (isDesktopReverse
              ? processedChildren.reversed.toList()
              : processedChildren)
          : (isMobileReverse
              ? processedChildren.reversed.toList()
              : processedChildren),
    );
  }
}
