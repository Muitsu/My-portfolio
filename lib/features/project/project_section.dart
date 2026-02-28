import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/section_wrapper.dart';

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
      onVisibilityChanged: (_) {},
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

class _ProjectCard extends StatelessWidget {
  final Map<String, dynamic> project;
  final bool isHovered;

  const _ProjectCard({
    required this.project,
    required this.isHovered,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isHovered
              ? const Color(0xFF00D9FF).withValues(alpha: 0.3)
              : const Color(0xFF222222),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF00D9FF).withValues(alpha: 0.3),
                        const Color(0xFF00FF88).withValues(alpha: 0.3),
                      ],
                    ),
                  ),
                  child: Image.network(
                    project['image'],
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: const Color(0xFF222222),
                      child: Center(
                        child: Icon(
                          Icons.code,
                          color: Colors.grey[600],
                          size: 48,
                        ),
                      ),
                    ),
                  ),
                ),
                if (isHovered)
                  Positioned.fill(
                    child: Container(
                      color: const Color(0xFF00D9FF).withValues(alpha: 0.1),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        project['title'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color(0xFFFFD700),
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${project['stars']}',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    project['description'],
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 13,
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Wrap(
                    spacing: 6,
                    children: (project['tags'] as List).map((tag) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1A1A),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          tag,
                          style: const TextStyle(
                            color: Color(0xFF00D9FF),
                            fontSize: 10,
                            fontFamily: 'monospace',
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
