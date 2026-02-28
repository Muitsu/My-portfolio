part of '../education_section.dart';

class _TimelineItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String period;
  final String description;

  final Animation<double> animation;

  const _TimelineItem({
    required this.title,
    required this.subtitle,
    required this.period,
    required this.description,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Opacity(opacity: animation.value, child: child
            // child: Transform.translate(
            //   // offset: Offset(
            //   //     isLeft
            //   //         ? -30 * (1 - animation.value)
            //   //         : 30 * (1 - animation.value),
            //   //     0),
            //   child: child,
            // ),
            );
      },
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF222222)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  period,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 12,
                    fontFamily: 'monospace',
                  ),
                ),
              ],
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
    );
  }
}
