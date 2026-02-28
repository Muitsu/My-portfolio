import 'package:flutter/material.dart';

class SectionWrapper extends StatefulWidget {
  final String title;
  final Widget child;

  const SectionWrapper({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  State<SectionWrapper> createState() => SectionWrapperState();
}

class SectionWrapperState extends State<SectionWrapper> {
  final GlobalKey _key = GlobalKey();
  bool _isVisible = false;
  bool _hasAnimated = false;

  // This attaches a listener to the nearest Scrollable parent
  ScrollPosition? _scrollPosition;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Remove old listener if any
    _scrollPosition?.removeListener(_scrollListener);

    // Attach new listener
    _scrollPosition = Scrollable.of(context).position;
    _scrollPosition?.addListener(_scrollListener);

    // Check immediately in case it's already in view
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollListener());
  }

  @override
  void dispose() {
    _scrollPosition?.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (_hasAnimated || !mounted) return;

    final context = _key.currentContext;
    if (context != null) {
      final renderBox = context.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        // Get the position of the widget
        final position = renderBox.localToGlobal(Offset.zero);
        final size = renderBox.size;
        final screenHeight = MediaQuery.of(context).size.height;

        // Check if the widget is visible in the viewport
        // If the top of the widget is above the bottom of the screen
        // And it hasn't scrolled completely past
        if (position.dy < screenHeight * 0.85 &&
            position.dy + size.height > 0) {
          setState(() {
            _isVisible = true;
            _hasAnimated = true;
          });
        }
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
          Row(
            children: [
              Container(
                width: 4,
                height: 30,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00D9FF), Color(0xFF00FF88)],
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                widget.title,
                style:
                    const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 60),
          // Only show the child when visible, triggering the animation inside children
          if (_isVisible) widget.child,
        ],
      ),
    );
  }
}

// class SectionWrapper extends StatefulWidget {
//   final String title;
//   final Widget child;
//   final Function(bool) onVisibilityChanged;

//   const SectionWrapper({
//     super.key,
//     required this.title,
//     required this.child,
//     required this.onVisibilityChanged,
//   });

//   @override
//   State<SectionWrapper> createState() => SectionWrapperState();
// }

// class SectionWrapperState extends State<SectionWrapper> {
//   final GlobalKey _key = GlobalKey();

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _checkVisibility();
//     });
//   }

//   void _checkVisibility() {
//     final context = _key.currentContext;
//     if (context != null) {
//       final renderBox = context.findRenderObject() as RenderBox?;
//       if (renderBox != null) {
//         final position = renderBox.localToGlobal(Offset.zero);
//         final isVisible = position.dy < MediaQuery.of(context).size.height;
//         widget.onVisibilityChanged(isVisible);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       key: _key,
//       padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 100),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _SectionTitle(title: widget.title),
//           const SizedBox(height: 60),
//           widget.child,
//         ],
//       ),
//     );
//   }
// }
