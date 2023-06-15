import 'package:flutter/material.dart';
import 'package:my_portfolio/section/intro/responsive/desktop_intro.dart';
import 'package:my_portfolio/section/intro/responsive/mobile_intro.dart';
import 'package:my_portfolio/section/intro/responsive/tablet_intro.dart';
import 'package:my_portfolio/widget/responsive.dart';

class MyIntro extends StatelessWidget {
  const MyIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileIntro(),
      tablet: TabletIntro(),
      desktop: DesktopIntro(),
    );
  }
}
