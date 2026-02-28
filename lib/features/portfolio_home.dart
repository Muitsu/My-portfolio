import 'package:flutter/material.dart';
import 'package:my_portfolio/core/responsive/breakpoints.dart';
import 'package:my_portfolio/features/about/about_section.dart';
import 'package:my_portfolio/features/contact/contact_section.dart';
import 'package:my_portfolio/features/education/education_section.dart';
import 'package:my_portfolio/features/experience/experience_section.dart';
import 'package:my_portfolio/features/hero/hero_section.dart';
import 'package:my_portfolio/features/project/project_section.dart';

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  bool _showFloatingAppBar = false;

  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    );
    _fadeController.forward();
    _scrollController.addListener(() {
      if (_scrollController.offset > 100 && !_showFloatingAppBar) {
        setState(() => _showFloatingAppBar = true);
      } else if (_scrollController.offset <= 100 && _showFloatingAppBar) {
        setState(() => _showFloatingAppBar = false);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Center(
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxWidth: Breakpoints.desktop),
                  child: Column(
                    children: [
                      const HeroSection(),
                      AboutSection(key: _aboutKey),
                      const EducationSection(),
                      ExperienceSection(key: _experienceKey),
                      ProjectsSection(key: _projectsKey),
                      ContactSection(key: _contactKey),
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
              top: _showFloatingAppBar ? 20 : -100, // Slide down from top
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: _showFloatingAppBar ? 1.0 : 0.0,
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
          _navItem("About", () => _scrollToSection(_aboutKey)),
          _navItem("Experience", () => _scrollToSection(_experienceKey)),
          _navItem("Projects", () => _scrollToSection(_projectsKey)),
          _navItem("Contact", () => _scrollToSection(_contactKey)),
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
