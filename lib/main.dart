import 'package:flutter/material.dart';
import 'package:my_portfolio/section/contact/contact_main.dart';
import 'package:my_portfolio/section/copyrights/copyrights_main.dart';
import 'package:my_portfolio/section/experience/experience_main.dart';
import 'package:my_portfolio/section/intro/intro_main.dart';
import 'package:my_portfolio/section/project/project_main.dart';
import 'core/constant/assets_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hi Welcome!',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AssetsColor.darkBlack),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AssetsColor.lightBlack,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyIntro(),
            MyContact(),
            MyExperience(),
            MyProject(),
            MyCopytights()
          ],
        ),
      ),
    );
  }
}
