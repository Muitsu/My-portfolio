import 'package:flutter/material.dart';

class GradientButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  State<GradientButton> createState() => GradientButtonState();
}

class GradientButtonState extends State<GradientButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: BoxDecoration(
            gradient: _isHovered
                ? const LinearGradient(
                    colors: [Color(0xFF00FF88), Color(0xFF00D9FF)],
                  )
                : const LinearGradient(
                    colors: [Color(0xFF00D9FF), Color(0xFF00FF88)],
                  ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: const Color(0xFF00D9FF).withValues(alpha: 0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.text,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.arrow_forward,
                color: Colors.black,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
