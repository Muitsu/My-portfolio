import 'package:flutter/material.dart';

import '../../constant/assets_color.dart';

class ExperienceJob extends StatefulWidget {
  final String duration;
  final String companyName;
  final void Function()? onTap;
  const ExperienceJob({
    super.key,
    required this.duration,
    required this.companyName,
    this.onTap,
  });

  @override
  State<ExperienceJob> createState() => _ExperienceJobState();
}

class _ExperienceJobState extends State<ExperienceJob> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        setState(() => isHover = value);
      },
      onTap: widget.onTap,
      child: Container(
          padding: const EdgeInsets.only(bottom: 60),
          color: isHover ? AssetsColor.lyeLight : AssetsColor.lightBlack,
          child: Table(
            children: [
              TableRow(children: [
                TableCell(
                  child: Text(
                    widget.duration,
                    style: const TextStyle(color: Colors.white54, fontSize: 22),
                  ),
                ),
                TableCell(
                  child: Text(
                    widget.companyName,
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                const TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Icon(
                      Icons.arrow_forward,
                      color: AssetsColor.orangeAmber,
                    )),
              ]),
            ],
          )

          // Row(
          //   children: [
          //     Text(
          //       duration,
          //       style: const TextStyle(color: Colors.white54, fontSize: 24),
          //     ),
          //     const SizedBox(width: 10),
          //     Text(
          //       companyName,
          //       style: const TextStyle(color: Colors.white, fontSize: 24),
          //     ),
          //     const SizedBox(width: 10),
          //     const Icon(
          //       Icons.arrow_forward,
          //       color: AssetsColor.orangeAmber,
          //     )
          //   ],
          // ),
          ),
    );
  }
}
