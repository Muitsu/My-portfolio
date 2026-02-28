import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/section_wrapper.dart';
import 'package:my_portfolio/features/project/project_model.dart';
import 'package:my_portfolio/providers/portfolio_provider.dart';
import 'package:provider/provider.dart';
part 'widget/project_card.dart';

// ============ Projects Section ============
class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  int _hoveredIndex = -1;

  late PortfolioProvider provider;

  @override
  void initState() {
    super.initState();
    provider = context.read<PortfolioProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'Selected Projects',
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          childAspectRatio: 1.4,
        ),
        itemCount: provider.projects.length,
        itemBuilder: (context, index) {
          return MouseRegion(
            onEnter: (_) => setState(() => _hoveredIndex = index),
            onExit: (_) => setState(() => _hoveredIndex = -1),
            child: AnimatedScale(
              scale: _hoveredIndex == index ? 1.02 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: _ProjectCard(
                project: provider.projects[index],
                isHovered: _hoveredIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
