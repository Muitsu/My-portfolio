part of '../hero_section.dart';

class _AnimatedScrollIndicator extends StatefulWidget {
  const _AnimatedScrollIndicator();

  @override
  State<_AnimatedScrollIndicator> createState() =>
      _AnimatedScrollIndicatorState();
}

class _AnimatedScrollIndicatorState extends State<_AnimatedScrollIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 10 * _controller.value),
          child: child,
        );
      },
      child: const Icon(
        Icons.keyboard_arrow_down,
        color: Color(0xFF00D9FF),
        size: 28,
      ),
    );
  }
}
