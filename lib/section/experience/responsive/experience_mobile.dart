import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../constant/portfolio_constants.dart';
import '../../../widget/mini_title.dart';
import '../../../widget/text_title.dart';
import '../experience_list.dart';
import '../experience_pop.dart';

class ExperienceMobile extends StatefulWidget {
  const ExperienceMobile({super.key});

  @override
  State<ExperienceMobile> createState() => _ExperienceMobileState();
}

class _ExperienceMobileState extends State<ExperienceMobile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
          top: size.height * 0.3,
          bottom: size.height * 0.2,
          left: mobileHorizontalPadding,
          right: mobileHorizontalPadding),
      child: Column(
        children: [
          const Text(
            'EXPERIENCE',
            style: TextStyle(
                letterSpacing: 6,
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
          const SizedBox(height: 60),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MiniTitle(text: 'Experience', fontSize: 20),
                  TextTitle(text: 'My career journey', fontSize: 26),
                ],
                // ),
              ),
              Padding(
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
              Center(
                child: SizedBox(
                    height: size.width * 0.4,
                    width: size.width * 0.4,
                    child: Lottie.network(LottiefileAsset.orange.url)),
              ),
              const Center(
                child: MiniTitle(
                    text: '"Life is like orange, keep rolling!"', fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
