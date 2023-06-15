import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformAwareAssetImage extends StatelessWidget {
  const PlatformAwareAssetImage(
      {super.key,
      required this.asset,
      this.package,
      this.height,
      this.width,
      this.fit = BoxFit.cover});

  final String asset;
  final double? height;
  final double? width;
  final String? package;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Image.network(
        'assets/${package == null ? '' : 'packages/$package/'}$asset',
        width: width,
        height: height,
        fit: fit,
      );
    }

    return Image.asset(
      asset,
      package: package,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
