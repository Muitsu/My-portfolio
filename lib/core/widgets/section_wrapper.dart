import 'package:flutter/material.dart';

class SectionWrapper extends StatefulWidget {
  final String title;
  final Widget child;
  final Function(bool) onVisibilityChanged;

  const SectionWrapper({
    super.key,
    required this.title,
    required this.child,
    required this.onVisibilityChanged,
  });

  @override
  State<SectionWrapper> createState() => SectionWrapperState();
}

class SectionWrapperState extends State<SectionWrapper> {
  final GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkVisibility();
    });
  }

  void _checkVisibility() {
    final context = _key.currentContext;
    if (context != null) {
      final renderBox = context.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        final position = renderBox.localToGlobal(Offset.zero);
        final isVisible = position.dy < MediaQuery.of(context).size.height;
        widget.onVisibilityChanged(isVisible);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _key,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(title: widget.title),
          const SizedBox(height: 60),
          widget.child,
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 30,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF00D9FF), Color(0xFF00FF88)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 16),
        Text(
          title,
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Container(
            height: 1,
            color: const Color(0xFF222222),
          ),
        ),
      ],
    );
  }
}
