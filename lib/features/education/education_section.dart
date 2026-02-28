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
          title: 'University Teknologi MARA (UiTM)',
          subtitle: 'Bachelor of Computer Science',
          period: '2017 - 2021',
          description:
              'Developed a Smart Attendance System using OpenCV and FaceNet (Computer Vision).',
          animation: _controller,
        ),
        const SizedBox(height: 40),
        _TimelineItem(
          title: 'Selangor Matriculation College',
          subtitle: 'Foundation in Accounting',
          period: '2016 - 2017',
          description:
              'Learning through professional certifications in Accounting',
          animation: _controller,
        ),
      ],
    );
  }
}
