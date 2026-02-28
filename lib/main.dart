import 'package:flutter/material.dart';
import 'package:my_portfolio/core/app_initializer.dart';
import 'package:my_portfolio/features/portfolio_home.dart';
import 'package:my_portfolio/providers/app_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.init();
  runApp(
    MultiProvider(
        providers: AppProviders.providers, child: const PortfolioApp()),
  );
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muiz Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
        fontFamily: 'SF Pro Display',
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00D9FF),
          secondary: Color(0xFF00FF88),
          surface: Color(0xFF111111),
          onSurface: Color(0xFFE0E0E0),
        ),
      ),
      home: const PortfolioHomePage(),
    );
  }
}
