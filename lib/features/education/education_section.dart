import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/section_wrapper.dart';
import 'package:my_portfolio/providers/portfolio_provider.dart';
import 'package:provider/provider.dart';

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
  late PortfolioProvider provider;
  @override
  void initState() {
    super.initState();
    provider = context.read<PortfolioProvider>();
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
    final edu = provider.educations;
    return ListView.separated(
        itemCount: edu.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) => _TimelineItem(
            title: edu[index].title,
            subtitle: edu[index].subtitle,
            period: edu[index].period,
            description: edu[index].description,
            animation: _controller),
        separatorBuilder: (_, ind) => const SizedBox(
              height: 40,
            ));
  }
}
