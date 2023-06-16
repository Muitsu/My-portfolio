import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class CustomNotification {
  static copyClipboard(BuildContext context,
      {String msg = 'Copy to clipboard', double? maxWidth}) {
    return Flushbar(
      message: msg,
      maxWidth: maxWidth ?? MediaQuery.of(context).size.width * 0.3,
      backgroundColor: Colors.black,
      icon: const Icon(
        Icons.copy_outlined,
        color: Colors.white,
      ),
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      margin: const EdgeInsets.only(top: 20),
      borderRadius: BorderRadius.circular(8),
      duration: const Duration(seconds: 1),
      shouldIconPulse: false,
      isDismissible: false,
    ).show(context);
  }
}
