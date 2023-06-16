import 'package:flutter/material.dart';
import 'package:my_portfolio/section/project/responsive/project_desktop.dart';
import 'package:my_portfolio/section/project/responsive/project_mobile.dart';
import 'package:my_portfolio/section/project/responsive/project_tablet.dart';
import 'package:my_portfolio/widget/responsive.dart';

class MyProject extends StatelessWidget {
  const MyProject({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: ProjectMobile(),
        tablet: ProjectTablet(),
        desktop: ProjectDesktop());
  }
}
