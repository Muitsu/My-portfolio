import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/section_wrapper.dart';

part 'widget/timeline_item.dart';

// ============ Education Section ============
class EducationSection extends StatefulWidget {
  const EducationSection({super.key});

  @override
  State<EducationSection> createState() => _EducationSectionState();
}

class _EducationSectionState extends State<EducationSection>
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
      title: 'Education',
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
          animation: _controller,
        ),
        const SizedBox(height: 40),
        _TimelineItem(
          title: 'Online Certifications',
          subtitle: 'AWS Solutions Architect, Google Cloud',
          period: '2019 - 2023',
          description:
              'Continuous learning through professional certifications in cloud architecture and DevOps.',
          animation: _controller,
        ),
      ],
    );
  }
}
