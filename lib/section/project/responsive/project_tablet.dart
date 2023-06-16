import 'package:flutter/material.dart';
import 'package:my_portfolio/widget/html_service.dart';

import '../../../constant/assets_color.dart';
import '../../../constant/portfolio_constants.dart';
import '../../../widget/mini_title.dart';
import '../../../widget/text_title.dart';

class ProjectTablet extends StatefulWidget {
  const ProjectTablet({super.key});

  @override
  State<ProjectTablet> createState() => _ProjectTabletState();
}

class _ProjectTabletState extends State<ProjectTablet> {
  final project = MyProject.values;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AssetsColor.darkBlack,
      padding: const EdgeInsets.symmetric(
          horizontal: tabletHorizontalPadding, vertical: 80),
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
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: project.length + 1,
              itemBuilder: (BuildContext ctx, index) {
                if (index == project.length) {
                  return ProjectButton(
                    onTap: () {
                      HtmlService.openWindow(
                          url: 'https://github.com/Muitsu?tab=repositories',
                          label: 'github');
                    },
                    child: const Text('See More'),
                  );
                }
                return ProjectButton(
                  onTap: () {},
                );
              }),
        ],
      ),
    );
  }
}

class ProjectButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget? child;
  const ProjectButton({
    super.key,
    this.onTap,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AssetsColor.lyeLight,
            borderRadius: BorderRadius.circular(15)),
        child: child,
      ),
    );
  }
}
