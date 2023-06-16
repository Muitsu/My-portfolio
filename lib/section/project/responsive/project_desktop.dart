import 'package:flutter/material.dart';

import '../../../constant/assets_color.dart';
import '../../../constant/portfolio_constants.dart';
import '../../../widget/mini_title.dart';
import '../../../widget/text_title.dart';

class ProjectDesktop extends StatefulWidget {
  const ProjectDesktop({super.key});

  @override
  State<ProjectDesktop> createState() => _ProjectDesktopState();
}

class _ProjectDesktopState extends State<ProjectDesktop> {
  final project = MyProject.values;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AssetsColor.darkBlack,
      padding: const EdgeInsets.symmetric(
          horizontal: desktopHorizontalPadding, vertical: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MiniTitle(text: 'Projects'),
          const TextTitle(text: 'Selected Project'),
          const SizedBox(height: 20),
          GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 40),
              itemCount: project.length + 1,
              itemBuilder: (BuildContext ctx, index) {
                if (index == project.length) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AssetsColor.lyeLight,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Text('See More'),
                  );
                }
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AssetsColor.lyeLight,
                      borderRadius: BorderRadius.circular(15)),
                );
              }),
        ],
      ),
    );
  }
}
