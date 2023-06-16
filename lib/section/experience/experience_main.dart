import 'package:flutter/material.dart';
import 'package:my_portfolio/section/experience/responsive/experience_desktop.dart';
import 'package:my_portfolio/section/experience/responsive/experience_mobile.dart';
import 'package:my_portfolio/section/experience/responsive/experience_tablet.dart';
import 'package:my_portfolio/widget/responsive.dart';

class MyExperience extends StatelessWidget {
  const MyExperience({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ExperienceMobile(),
      tablet: ExperienceTablet(),
      desktop: ExperienceDesktop(),
    );
  }
}
