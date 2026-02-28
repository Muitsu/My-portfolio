import 'package:flutter/material.dart';

class PortfolioProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  bool showFloatingAppBar = false;

  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey educationeKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void initController() {
    scrollController.addListener(() {
      if (scrollController.offset > 100 && !showFloatingAppBar) {
        showFloatingAppBar = true;
        WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());
      } else if (scrollController.offset <= 100 && showFloatingAppBar) {
        showFloatingAppBar = false;
        WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());
      }
    });
  }

  void disposeController() {
    scrollController.dispose();
  }

  void scrollToAbout() => _scrollToSection(aboutKey);
  void scrollToEducationeKey() => _scrollToSection(educationeKey);
  void scrollToExperience() => _scrollToSection(experienceKey);
  void scrollToProject() => _scrollToSection(projectsKey);
  void scrollToContact() => _scrollToSection(contactKey);

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }
}
