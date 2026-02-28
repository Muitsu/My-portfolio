part of '../hero_section.dart';

class _GlitchText extends StatefulWidget {
  final String text;
  final double fontSize;

  const _GlitchText({
    required this.text,
    this.fontSize = 72,
  });

  @override
  State<_GlitchText> createState() => _GlitchTextState();
}

class _GlitchTextState extends State<_GlitchText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
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
        final offset = _controller.value * 4;
        return Stack(
          children: [
            Text(
              widget.text,
              style: TextStyle(
                fontSize: widget.fontSize,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..style = PaintingStyle.fill
                  ..color = const Color(0xFF00D9FF).withValues(alpha: 0.8),
              ),
            ),
            Transform.translate(
              offset: Offset(-offset, offset),
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..style = PaintingStyle.fill
                    ..color = const Color(0xFFFF0080).withValues(alpha: 0.5),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(offset, -offset),
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..style = PaintingStyle.fill
                    ..color = const Color(0xFF00FF88).withValues(alpha: 0.5),
                ),
              ),
            ),
            Text(
              widget.text,
              style: TextStyle(
                fontSize: widget.fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }
}
