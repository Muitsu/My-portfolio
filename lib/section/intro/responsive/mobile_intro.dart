import 'package:flutter/material.dart';

import '../../../core/constant/assets_color.dart';
import '../../../core/constant/assets_img.dart';
import '../../../core/constant/portfolio_constants.dart';
import '../../../widget/html_service.dart';
import '../../../widget/platform_image.dart';
import '../../../widget/text_title.dart';
import '../thankyou_dialog.dart';

class MobileIntro extends StatelessWidget {
  const MobileIntro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        // height: size.height * 0.98,
        width: double.infinity,
        color: AssetsColor.lightBlack,
        padding:
            const EdgeInsets.symmetric(horizontal: mobileHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                InfoTab.values.length,
                (index) => GestureDetector(
                  child: Container(
                    color: AssetsColor.lightBlack,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          InfoTab.values[index].name,
                          style: const TextStyle(
                              fontSize: 20, color: AssetsColor.whiteMatte),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 6),
                          color: AssetsColor.orangeAmber,
                          height: size.height * 0.008,
                          width: size.width * 0.02,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.7,
              // width: size.width * 0.8,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                      bottom: 0,
                      left: 160,
                      child: Transform.flip(
                        flipX: true,
                        child: PlatformAwareAssetImage(
                          asset: AssetsImg.mySelf,
                          fit: BoxFit.contain,
                          height: size.height * 0.6,
                          width: size.width * 0.5,
                        ),
                      )),
                  Positioned(
                    top: 220,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          MyName.nameWhitespace.name,
                          style: const TextStyle(
                              letterSpacing: 6,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 25),
                          color: AssetsColor.orangeAmber,
                          height: size.height * 0.01,
                          width: size.width * 0.05,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 40),
            TextTitle(
                text: "Hi, I'm ${MyName.shortName.name}. A Software Developer"),
            SizedBox(height: size.height * 0.04),
            const Text(
              "Front End | Mobile Apps | UI Design",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: AssetsColor.whiteMatte),
            ),
            SizedBox(height: size.height * 0.04),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    HtmlService.download(
                      url: DownloadUrl.resume.url,
                      title: DownloadUrl.resume.name,
                    );
                    showDialog(
                        context: context,
                        builder: (context) => const ThankYouDialog());
                  },
                  child: const Text(
                    'Get My Resume',
                    style:
                        TextStyle(fontSize: 18, color: AssetsColor.darkBlack),
                  )),
            ),
            const SizedBox(height: 40),
          ],
        ));
  }
}
