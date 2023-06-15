import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constant/portfolio_constants.dart';

class ThankYouDialog extends StatelessWidget {
  const ThankYouDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => true,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              // height: 160,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LottieBuilder.network(
                    LottiefileAsset.bear.url,
                    height: size.height * 0.2,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 12),
                    child: Text(
                      'Thanks for getting my resume!',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  const SizedBox(height: 14),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
