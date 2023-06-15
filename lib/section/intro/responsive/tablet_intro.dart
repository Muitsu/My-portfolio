import 'package:flutter/material.dart';

import '../../../constant/assets_color.dart';
import '../../../constant/assets_img.dart';
import '../../../constant/portfolio_constants.dart';
import '../../../widget/platform_image.dart';
import '../../../widget/text_title.dart';
import '../thankyou_dialog.dart';

class TabletIntro extends StatelessWidget {
  const TabletIntro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.83,
      width: double.infinity,
      color: AssetsColor.lightBlack,
      padding: const EdgeInsets.symmetric(horizontal: tabletHorizontalPadding),
      child: Row(
        children: [
          SizedBox(
            width: size.width * 0.3,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                    bottom: 0,
                    left: 90,
                    child: Transform.flip(
                      flipX: true,
                      child: PlatformAwareAssetImage(
                        asset: AssetsImg.mySelf,
                        fit: BoxFit.contain,
                        height: size.height * 0.6,
                        width: size.width * 0.24,
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
                            fontSize: 40,
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
          const SizedBox(width: 50),
          Expanded(
            // width: size.width * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                                  fontSize: 18, color: AssetsColor.whiteMatte),
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
                SizedBox(height: size.height * 0.14),
                TextTitle(
                    text:
                        "Hi, I'm ${MyName.shortName.name}. A Software Developer"),
                SizedBox(height: size.height * 0.04),
                const Text(
                  "Front End | Mobile Apps | UI Design",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: AssetsColor.whiteMatte),
                ),
                SizedBox(height: size.height * 0.04),
                ElevatedButton(
                    onPressed: () {
                      //  HtmlService.download(
                      //   url: DownloadUrl.resume.url,
                      //   title: DownloadUrl.resume.name,
                      // );
                      showDialog(
                          context: context,
                          builder: (context) => const ThankYouDialog());
                    },
                    child: const Text(
                      'Get My Resume',
                      style:
                          TextStyle(fontSize: 18, color: AssetsColor.darkBlack),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
