import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/widget/custom_notification.dart';
import 'package:my_portfolio/widget/html_service.dart';
import 'package:my_portfolio/widget/platform_image.dart';

import '../../../constant/assets_color.dart';
import '../../../constant/portfolio_constants.dart';
import '../../../widget/mini_title.dart';
import '../../../widget/text_title.dart';
import '../contact_label.dart';

class ContactTablet extends StatelessWidget {
  const ContactTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double titleSpace = 14;
    double descSpace = 20;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: tabletHorizontalPadding),
      width: double.infinity,
      color: AssetsColor.darkBlack,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 120),
              const Text(
                'ABOUT ME',
                style: TextStyle(
                    letterSpacing: 6,
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              const SizedBox(height: 40),
              const MiniTitle(text: 'My thought', fontSize: 22),
              SizedBox(height: titleSpace),
              const TextTitle(text: 'Coding is my passion !', fontSize: 30),
              SizedBox(height: titleSpace),
              const Text(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 1,
                  height: 1.5,
                  wordSpacing: 4,
                ),
                "What I like about coding is the ability to create cool stuff with just a laptop and internet connection. It is like having a magic. With great power, comes great responsibility. Hence, I wanted to build software that will give positive impact for people.",
              ),
              SizedBox(height: titleSpace),
              const Text(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 1,
                  height: 1.5,
                  wordSpacing: 4,
                ),
                "My work experience focuses on frontend develoment. I love to develop beautiful UI's, make interactive & responsive apps to have a good impression on user experience.",
              ),
              SizedBox(height: titleSpace),
              const Text(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 1,
                  height: 1.5,
                  wordSpacing: 4,
                ),
                "I'm familiar with Flutter mobile app development, BLoC, Provider state management and app notification.",
              ),
              SizedBox(height: titleSpace),
              const Text(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 1,
                  height: 1.5,
                  wordSpacing: 4,
                ),
                "I'm also had a little experience with backend development using Java Springboot, along with databases such as MySQL and Firebase.",
              ),
              const SizedBox(height: 60),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * 0.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MiniTitle(text: 'Contact', fontSize: 22),
                        SizedBox(height: titleSpace),
                        const TextTitle(
                            text: "Am I the one you've been seeking?",
                            fontSize: 30),
                        SizedBox(height: descSpace),
                        RichText(
                            text: TextSpan(
                                style: const TextStyle(
                                    letterSpacing: 1,
                                    height: 1.5,
                                    wordSpacing: 4,
                                    color: Colors.white,
                                    fontSize: 18),
                                children: [
                              const TextSpan(
                                  text: 'You can contact me through my email '),
                              TextSpan(
                                  text: 'ahmadmuizzuddin13@gmail.com',
                                  style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      HtmlService.copyToClipboard(
                                          text: 'ahmadmuizzuddin13@gmail.com');
                                      CustomNotification.copyClipboard(context);
                                    }),
                              const TextSpan(
                                  text: " and I'll get back to you."),
                            ]))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MiniTitle(text: AboutMe.about.miniTitle, fontSize: 22),
                        SizedBox(height: titleSpace),
                        TextTitle(text: AboutMe.about.title, fontSize: 30),
                        SizedBox(height: descSpace),
                        Text(
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 1,
                            height: 1.5,
                            wordSpacing: 4,
                          ),
                          AboutMe.about.desc,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LabelAboutMe(
                              title: '${DateTime.now().year - 2021}',
                              sub1: 'Years',
                              sub2: ' Experience',
                            ),
                            const LabelAboutMe(
                              title: '4',
                              sub1: 'Project',
                              sub2: 'Involves',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 160),
            ],
          ),
          Positioned(
            bottom: -120,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              width: size.width * .75,
              color: AssetsColor.lyeLight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Tech Stack',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 80,
                    child: Center(
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: TechStack.values.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: PlatformAwareAssetImage(
                                  asset: TechStack.values[index].img),
                            );
                          }),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
