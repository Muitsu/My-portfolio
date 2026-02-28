import 'package:flutter/material.dart';
import 'package:my_portfolio/core/responsive/responsive.dart';
import 'package:my_portfolio/core/widgets/map_utils.dart/map_widget.dart';
import 'package:my_portfolio/core/widgets/section_wrapper.dart';
import 'package:my_portfolio/providers/portfolio_provider.dart';
import 'package:provider/provider.dart';

// ============ Experience Section ============
class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int hoveredIndex = -1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
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
    final isDesktop = Responsive.isDesktop(context);
    final experiences = context.read<PortfolioProvider>().experiences;
    return SectionWrapper(
      title: 'Experience',
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isDesktop)
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: MapWidget(
                width: 400,
                markers: [MapMarker(latitude: 3.1390, longitude: 101.6869)],
              ),
            ),
          Expanded(
            child: Column(
              children: List.generate(experiences.length, (index) {
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
                    // onEnter: (_) => setState(() =>  hoveredIndex = index),
                    // onExit: (_) => setState(() =>  hoveredIndex = -1),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      // margin: const EdgeInsets.only(bottom: 24),
                      padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                      decoration: BoxDecoration(
                        color: hoveredIndex == index
                            ? const Color(0xFF1A1A1A)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: hoveredIndex == index
                              ? const Color(0xFF00D9FF).withValues(alpha: 0.3)
                              : Colors.transparent,
                        ),
                      ),
                      child: _buildExperienceItem(
                          company: experiences[index].company,
                          role: experiences[index].role,
                          period: experiences[index].period,
                          icon: experiences[index].icon,
                          isLast: index == experiences.length - 1,
                          points: experiences[index].points),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem({
    required String company,
    required String role,
    required String period,
    required IconData icon,
    required List<String> points,
    bool isLast = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline Column
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white10),
                ),
                child: Icon(icon, color: Colors.grey, size: 20),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 1,
                    color: Colors.white10,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 20),
          // Content Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        company,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      period,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  role,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                ...points.map((point) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '/ ',
                            style: TextStyle(
                                color: Colors.tealAccent,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Text(
                              point,
                              style: TextStyle(
                                  color: Colors.grey[400], height: 1.4),
                            ),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
