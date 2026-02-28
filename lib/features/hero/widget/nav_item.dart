part of '../hero_section.dart';

class _NavItem extends StatefulWidget {
  final String title;

  const _NavItem({required this.title});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: Column(
          children: [
            Text(
              widget.title,
              style: TextStyle(
                color: _isHovered ? const Color(0xFF00D9FF) : Colors.grey[400],
                fontSize: 14,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: _isHovered ? 20 : 0,
              height: 2,
              decoration: BoxDecoration(
                color: const Color(0xFF00D9FF),
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
