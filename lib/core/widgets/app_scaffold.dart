import 'package:flutter/material.dart';
import '../responsive/responsive_builder.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;

  const AppScaffold({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        mobile: _MobileLayout(child: child),
        tablet: _DesktopLayout(child: child),
        desktop: _DesktopLayout(child: child),
      ),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  final Widget child;

  const _MobileLayout({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const TopBar(),
      // drawer: const SideBar(),
      body: child,
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  final Widget child;

  const _DesktopLayout({required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // const SideBar(),
        Expanded(
          child: Column(
            children: [
              // const TopBar(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
