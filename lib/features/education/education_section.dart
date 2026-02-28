import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/section_wrapper.dart';

// ============ Education Section ============
class EducationSection extends StatefulWidget {
  const EducationSection({super.key});

  @override
  State<EducationSection> createState() => _EducationSectionState();
}

class _EducationSectionState extends State<EducationSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
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
      title: 'Education',
      onVisibilityChanged: _onVisibilityChanged,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Opacity(
            opacity: _controller.value,
            child: child,
          );
        },
        child: _buildTimeline(),
      ),
    );
  }

  Widget _buildTimeline() {
    return Column(
      children: [
        _TimelineItem(
          title: 'University of Waterloo',
          subtitle: 'Bachelor of Computer Science',
          period: '2015 - 2018',
          description:
              'Specialized in Software Engineering with focus on distributed systems and machine learning.',
          isLeft: true,
          animation: _controller,
        ),
        const SizedBox(height: 40),
        _TimelineItem(
          title: 'Online Certifications',
          subtitle: 'AWS Solutions Architect, Google Cloud',
          period: '2019 - 2023',
          description:
              'Continuous learning through professional certifications in cloud architecture and DevOps.',
          isLeft: false,
          animation: _controller,
        ),
      ],
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String period;
  final String description;
  final bool isLeft;
  final Animation<double> animation;

  const _TimelineItem({
    required this.title,
    required this.subtitle,
    required this.period,
    required this.description,
    required this.isLeft,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Opacity(
          opacity: animation.value,
          child: Transform.translate(
            offset: Offset(
                isLeft
                    ? -30 * (1 - animation.value)
                    : 30 * (1 - animation.value),
                0),
            child: child,
          ),
        );
      },
      child: Row(
        children: [
          if (!isLeft) const Spacer(),
          Container(
            width: 400,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF111111),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF222222)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  period,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 12,
                    fontFamily: 'monospace',
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF00D9FF),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          if (isLeft) const Spacer(),
        ],
      ),
    );
  }
}
