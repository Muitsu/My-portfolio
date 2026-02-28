import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/section_wrapper.dart';

part 'widget/skill_bar.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'About',
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Opacity(
            opacity: _controller.value,
            child: Transform.translate(
              offset: Offset(0, 40 * (1 - _controller.value)),
              child: child,
            ),
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Crafting Digital Excellence',
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 18,
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'With over 6 years of experience in full-stack development, '
                    'I believe in writing clean, maintainable code that solves real problems. '
                    'My approach combines technical expertise with a deep understanding of user needs.',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'I specialize in building scalable web applications, from concept to deployment. '
                    'My expertise spans across modern JavaScript frameworks, backend architectures, '
                    'and cloud infrastructure.',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                      height: 1.8,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 80),
            Expanded(
              child: _buildSkillsGrid(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsGrid() {
    final skills = [
      ('React', 0.95),
      ('Node.js', 0.90),
      ('TypeScript', 0.92),
      ('Python', 0.85),
      ('AWS', 0.88),
      ('Docker', 0.82),
    ];

    return Column(
      children: skills.map((skill) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: _SkillBar(
            skill: skill.$1,
            percentage: skill.$2,
            animation: _controller,
          ),
        );
      }).toList(),
    );
  }
}
