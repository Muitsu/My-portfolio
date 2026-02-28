import 'package:flutter/material.dart';
import 'package:my_portfolio/core/responsive/breakpoints.dart';
import 'package:my_portfolio/features/about/about_section.dart';
import 'package:my_portfolio/features/contact/contact_section.dart';
import 'package:my_portfolio/features/education/education_section.dart';
import 'package:my_portfolio/features/experience/experience_section.dart';
import 'package:my_portfolio/features/hero/hero_section.dart';
import 'package:my_portfolio/features/project/project_section.dart';
import 'package:my_portfolio/providers/portfolio_provider.dart';
import 'package:provider/provider.dart';

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage>
    with TickerProviderStateMixin {
  late PortfolioProvider provider;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    provider = context.read<PortfolioProvider>();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    );
    _fadeController.forward();
    provider.initController();
  }

  @override
  void dispose() {
    provider.disposeController();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final showFloatingAppBar =
        context.watch<PortfolioProvider>().showFloatingAppBar;
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: provider.scrollController,
              child: Center(
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxWidth: Breakpoints.desktop - 200),
                  child: Column(
                    children: [
                      const HeroSection(),
                      AboutSection(key: provider.aboutKey),
                      EducationSection(key: provider.educationeKey),
                      ExperienceSection(key: provider.experienceKey),
                      ProjectsSection(key: provider.projectsKey),
                      ContactSection(key: provider.contactKey),
                      _buildFooter(),
                    ],
                  ),
                ),
              ),
            ),
            // 4. The Floating AppBar Logic
            AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              top: provider.showFloatingAppBar
                  ? 20
                  : -100, // Slide down from top
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: showFloatingAppBar ? 1.0 : 0.0,
                child: Center(
                  child: _buildFloatingNav(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingNav() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _navItem("About", provider.scrollToAbout),
          _navItem("Education", provider.scrollToEducationeKey),
          _navItem("Experience", provider.scrollToExperience),
          _navItem("Projects", provider.scrollToProject),
          _navItem("Contact", provider.scrollToContact),
        ],
      ),
    );
  }

  Widget _navItem(String title, VoidCallback onTap) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 80),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xFF222222), width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '© 2026 All rights reserved.',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          Row(
            children: [
              _buildSocialIcon(Icons.code),
              const SizedBox(width: 16),
              _buildSocialIcon(Icons.alternate_email),
              const SizedBox(width: 16),
              _buildSocialIcon(Icons.link),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Icon(
        icon,
        color: Colors.grey[600],
        size: 20,
      ),
    );
  }
}
