part of "../about_section.dart";

class _SkillBar extends StatelessWidget {
  final String skill;
  final double percentage;
  final Animation<double> animation;

  const _SkillBar({
    required this.skill,
    required this.percentage,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              skill,
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Text(
                  '${(percentage * 100 * animation.value).toInt()}%',
                  style: const TextStyle(
                    color: Color(0xFF00D9FF),
                    fontSize: 12,
                    fontFamily: 'monospace',
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 6,
          decoration: BoxDecoration(
            color: const Color(0xFF222222),
            borderRadius: BorderRadius.circular(3),
          ),
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return FractionallySizedBox(
                widthFactor: percentage * animation.value,
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF00D9FF), Color(0xFF00FF88)],
                    ),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
