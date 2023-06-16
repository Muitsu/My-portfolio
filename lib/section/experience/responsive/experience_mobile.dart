import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../constant/portfolio_constants.dart';
import '../../../widget/mini_title.dart';
import '../../../widget/text_title.dart';
import '../experience_list.dart';

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
                                                  fontWeight: FontWeight.bold),
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
