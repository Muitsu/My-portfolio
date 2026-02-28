import 'package:flutter/material.dart';

class MyOutlinedButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const MyOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  State<MyOutlinedButton> createState() => MyOutlinedButtonState();
}

class MyOutlinedButtonState extends State<MyOutlinedButton> {
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
            color: _isHovered ? const Color(0xFF222222) : Colors.transparent,
            border: Border.all(
              color: _isHovered ? const Color(0xFF00D9FF) : Colors.grey[600]!,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              color: _isHovered ? const Color(0xFF00D9FF) : Colors.grey[400],
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
}
