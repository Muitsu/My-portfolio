import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constant/portfolio_constants.dart';
import '../../widget/mini_title.dart';
import '../../widget/text_title.dart';
import 'experience_list.dart';

class MyExperience extends StatelessWidget {
  const MyExperience({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
          top: size.height * 0.2,
          bottom: size.height * 0.2,
          left: desktopHorizontalPadding,
          right: desktopHorizontalPadding),
      child: Column(
        children: [
          const Text(
            'EXPERIENCE',
            style: TextStyle(
                letterSpacing: 6,
                fontSize: 50,
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
                    const MiniTitle(text: 'Experience'),
                    const TextTitle(text: 'My career journey'),
                    SizedBox(
                        height: size.width * 0.2,
                        width: size.width * 0.2,
                        child: Lottie.network(LottiefileAsset.orange.url)),
                    const MiniTitle(
                        text: '"Life is like orange, keep rolling!"'),
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
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => const Dialog(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [Text('Experience at')],
                                          ),
                                        ));
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
