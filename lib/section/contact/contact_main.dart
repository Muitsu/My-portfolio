import 'package:flutter/material.dart';
import 'package:my_portfolio/section/contact/responsive/contact_desktop.dart';
import 'package:my_portfolio/section/contact/responsive/contact_mobile.dart';
import 'package:my_portfolio/section/contact/responsive/contact_tablet.dart';
import 'package:my_portfolio/widget/responsive.dart';

class MyContact extends StatelessWidget {
  const MyContact({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContactMobile(),
      tablet: ContactTablet(),
      desktop: ContactDesktop(),
    );
  }
}
