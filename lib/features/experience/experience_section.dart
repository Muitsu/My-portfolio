import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/section_wrapper.dart';

// ============ Experience Section ============
class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isVisible = false;
  int _hoveredIndex = -1;

  final List<Map<String, dynamic>> _experiences = [
    {
      'company': 'Vercel',
      'role': 'Senior Software Engineer',
      'period': '2022 - Present',
      'description':
          'Leading development of core platform features. Improved deployment pipeline efficiency by 40%.',
      'tech': ['React', 'Next.js', 'Node.js', 'PostgreSQL'],
    },
    {
      'company': 'Linear',
      'role': 'Full Stack Engineer',
      'period': '2020 - 2022',
      'description':
          'Built real-time collaboration features. Architected the sync engine for offline-first experience.',
      'tech': ['TypeScript', 'React', 'GraphQL', 'Redis'],
    },
    {
      'company': 'Stripe',
      'role': 'Software Engineer',
      'period': '2018 - 2020',
      'description':
          'Developed payment processing infrastructure. Handled millions of transactions daily.',
      'tech': ['Ruby', 'Go', 'Kafka', 'MySQL'],
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(bool visible) {
    if (visible && !_isVisible) {
      setState(() => _isVisible = true);
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'Experience',
      onVisibilityChanged: _onVisibilityChanged,
      child: Column(
        children: List.generate(_experiences.length, (index) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final delay = index * 0.2;
              final animValue = Curves.easeOutCubic.transform(
                (_controller.value - delay).clamp(0.0, 1.0),
              );
              return Opacity(
                opacity: animValue,
                child: Transform.translate(
                  offset: Offset(50 * (1 - animValue), 0),
                  child: child,
                ),
              );
            },
            child: MouseRegion(
              onEnter: (_) => setState(() => _hoveredIndex = index),
              onExit: (_) => setState(() => _hoveredIndex = -1),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.only(bottom: 24),
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: _hoveredIndex == index
                      ? const Color(0xFF1A1A1A)
                      : const Color(0xFF111111),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: _hoveredIndex == index
                        ? const Color(0xFF00D9FF).withValues(alpha: 0.3)
                        : const Color(0xFF222222),
                  ),
                ),
                child: _buildExperienceItem(_experiences[index]),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildExperienceItem(Map<String, dynamic> exp) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            exp['period'],
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 14,
              fontFamily: 'monospace',
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    exp['company'],
                    style: const TextStyle(
                      color: Color(0xFF00D9FF),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    exp['role'],
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                exp['description'],
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 14,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: (exp['tech'] as List).map((t) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF222222),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      t,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 12,
                        fontFamily: 'monospace',
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
