import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/section_wrapper.dart';
part 'widget/project_card.dart';

// ============ Projects Section ============
class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  int _hoveredIndex = -1;

  final List<Map<String, dynamic>> _projects = [
    {
      'title': 'CloudSync',
      'description':
          'Real-time file synchronization platform with conflict resolution. Handles 100K+ concurrent users.',
      'image': 'https://picsum.photos/seed/cloud/600/400',
      'tags': ['Next.js', 'WebSocket', 'AWS S3'],
      'stars': 2340,
    },
    {
      'title': 'DevMetrics',
      'description':
          'Analytics dashboard for development teams. Track productivity and code quality metrics.',
      'image': 'https://picsum.photos/seed/metrics/600/400',
      'tags': ['React', 'D3.js', 'PostgreSQL'],
      'stars': 1856,
    },
    {
      'title': 'CodeFlow',
      'description':
          'Open-source CI/CD pipeline tool with visual workflow builder and Git integration.',
      'image': 'https://picsum.photos/seed/flow/600/400',
      'tags': ['Go', 'Docker', 'Kubernetes'],
      'stars': 3102,
    },
    {
      'title': 'NotionClone',
      'description':
          'Collaborative workspace with block-based editor and real-time collaboration features.',
      'image': 'https://picsum.photos/seed/notion/600/400',
      'tags': ['TypeScript', 'Yjs', 'SQLite'],
      'stars': 4521,
    },
  ];

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
        itemCount: _projects.length,
        itemBuilder: (context, index) {
          return MouseRegion(
            onEnter: (_) => setState(() => _hoveredIndex = index),
            onExit: (_) => setState(() => _hoveredIndex = -1),
            child: AnimatedScale(
              scale: _hoveredIndex == index ? 1.02 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: _ProjectCard(
                project: _projects[index],
                isHovered: _hoveredIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
