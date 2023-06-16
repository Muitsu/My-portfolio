import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../constant/portfolio_constants.dart';
import '../../../widget/mini_title.dart';
import '../../../widget/text_title.dart';
import '../experience_list.dart';

class ExperienceDesktop extends StatefulWidget {
  const ExperienceDesktop({super.key});

  @override
  State<ExperienceDesktop> createState() => _ExperienceDesktopState();
}

class _ExperienceDesktopState extends State<ExperienceDesktop> {
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
                                    builder: (_) => const AlertDialog(
                                          insetPadding: EdgeInsets.symmetric(
                                              horizontal: 300),
                                          content: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Center(
                                                child: Text(
                                                  'Experience working at',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                              Center(
                                                  child: Text(
                                                'Heitech Padu Berhad',
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              Divider(),
                                              SizedBox(height: 20),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Job Designations: ',
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  ),
                                                  Text(
                                                    'Software Developer',
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 15),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Duration of Work: ',
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  ),
                                                  Text(
                                                    '2 Years',
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 15),
                                              Text(
                                                'Responsibility',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                'As a mobile developer, it is your responsibility to design, develop, and maintain innovative and user-friendly mobile applications that meet the needs and expectations of the users while adhering to industry best practices and standards.',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              SizedBox(height: 15),
                                            ],
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
