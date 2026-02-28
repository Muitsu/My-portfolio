import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constant/assets_img.dart';
import 'package:my_portfolio/core/responsive/responsive_flex.dart';
import 'package:my_portfolio/core/widgets/gradient_button.dart';
import 'package:my_portfolio/core/widgets/my_outline_button.dart';

part 'widget/nav_item.dart';
part 'widget/animated_scroll_indicator.dart';
part 'widget/glitch_text.dart';

// ============ Hero Section ============
class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _titleAnimation;
  late Animation<double> _subtitleAnimation;
  late Animation<double> _buttonAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _titleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOutCubic),
      ),
    );

    _subtitleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.7, curve: Curves.easeOutCubic),
      ),
    );

    _buttonAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOutCubic),
      ),
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
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
      child: Stack(
        children: [
          _buildAnimatedBackground(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNavigation(),
              const Spacer(),
              ResponsiveFlex(
                isMobileReverse: true,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedBuilder(
                        animation: _titleAnimation,
                        builder: (context, child) {
                          return Opacity(
                            opacity: _titleAnimation.value,
                            child: Transform.translate(
                              offset:
                                  Offset(0, 50 * (1 - _titleAnimation.value)),
                              child: child,
                            ),
                          );
                        },
                        child: const _GlitchText(
                          text: 'Mobile Developer.',
                          fontSize: 72,
                        ),
                      ),
                      const SizedBox(height: 24),
                      AnimatedBuilder(
                        animation: _subtitleAnimation,
                        builder: (context, child) {
                          return Opacity(
                            opacity: _subtitleAnimation.value,
                            child: Transform.translate(
                              offset: Offset(
                                  0, 30 * (1 - _subtitleAnimation.value)),
                              child: child,
                            ),
                          );
                        },
                        child: SizedBox(
                          width: 600,
                          child: Text(
                            'Building exceptional digital experiences with modern technologies. '
                            'Specialized in React, Node.js, and Cloud Architecture.',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 20,
                              height: 1.6,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    AssetsImg.myFace,
                    scale: 1.2,
                  )
                ],
              ),
              const SizedBox(height: 48),
              AnimatedBuilder(
                animation: _buttonAnimation,
                builder: (context, child) {
                  return Opacity(
                    opacity: _buttonAnimation.value,
                    child: child,
                  );
                },
                child: _buildCTAButtons(),
              ),
              const Spacer(),
              _buildScrollIndicator(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedBackground() {
    return Positioned.fill(
      child: CustomPaint(
        painter: GridPainter(),
      ),
    );
  }

  Widget _buildNavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLogo(),
        _buildNavLinks(),
      ],
    );
  }

  Widget _buildLogo() {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF00D9FF), Color(0xFF00FF88)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              'JD',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'John Doe',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildNavLinks() {
    final items = ['About', 'Education', 'Experience', 'Projects', 'Contact'];
    return Row(
      children: items.map((item) {
        return _NavItem(title: item);
      }).toList(),
    );
  }

  Widget _buildCTAButtons() {
    return Row(
      children: [
        GradientButton(
          text: 'View Projects',
          onPressed: () {},
        ),
        const SizedBox(width: 20),
        MyOutlinedButton(
          text: 'Download CV',
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildScrollIndicator() {
    return Center(
      child: Column(
        children: [
          Text(
            'Scroll to explore',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 12),
          const _AnimatedScrollIndicator(),
        ],
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF1A1A1A)
      ..strokeWidth = 0.5;

    const spacing = 60.0;

    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
