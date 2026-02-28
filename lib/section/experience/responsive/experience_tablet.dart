import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constant/portfolio_constants.dart';
import '../../../widget/mini_title.dart';
import '../../../widget/text_title.dart';
import '../experience_list.dart';
import '../experience_pop.dart';

class ExperienceTablet extends StatefulWidget {
  const ExperienceTablet({super.key});

  @override
  State<ExperienceTablet> createState() => _ExperienceTabletState();
}

class _ExperienceTabletState extends State<ExperienceTablet> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
          top: size.height * 0.3,
          bottom: size.height * 0.2,
          left: tabletHorizontalPadding,
          right: tabletHorizontalPadding),
      child: Column(
        children: [
          const Text(
            'EXPERIENCE',
            style: TextStyle(
                letterSpacing: 6,
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
          const SizedBox(height: 60),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MiniTitle(text: 'Experience', fontSize: 20),
                    const TextTitle(text: 'My career journey', fontSize: 26),
                    SizedBox(
                        height: size.width * 0.2,
                        width: size.width * 0.2,
                        child: Lottie.network(LottiefileAsset.orange.url)),
                    const MiniTitle(
                        text: '"Life is like orange, keep rolling!"',
                        fontSize: 20),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                          ExperienceList.values.length,
                          (index) => ExperienceJob(
                              fontSizeDuration: 18,
                              fontSizeCompName: 20,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => ExperiencePopUp(
                                    companyName:
                                        ExperienceList.values[index].name,
                                    jobPesignation: ExperienceList
                                        .values[index].jobPesignation,
                                    yearsWork:
                                        ExperienceList.values[index].yearsWork,
                                    responsibility: ExperienceList
                                        .values[index].responsibility,
                                    techStack:
                                        ExperienceList.values[index].techStack,
                                  ),
                                );
                              },
                              duration: ExperienceList.values[index].duration,
                              companyName: ExperienceList.values[index].name))),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
