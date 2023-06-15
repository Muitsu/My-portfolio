import 'package:universal_html/html.dart' as html;
import 'package:flutter/services.dart';

class HtmlService {
  static Future<void> download(
      {required String url, required String title}) async {
    html.AnchorElement anchorElement = html.AnchorElement(href: url);
    anchorElement.download = title;
    anchorElement.click();
  }

  static Future<void> copyToClipboard({required String text}) async {
    Clipboard.setData(ClipboardData(text: text));
  }
}
