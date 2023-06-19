import 'package:flutter/material.dart';

import '../../constant/assets_color.dart';

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
