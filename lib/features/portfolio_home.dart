import 'package:flutter/material.dart';
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
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Scaffold(
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              const HeroSection(),
              const AboutSection(),
              const EducationSection(),
              const ExperienceSection(),
              const ProjectsSection(),
              const ContactSection(),
              _buildFooter(),
            ],
          ),
        ),
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
