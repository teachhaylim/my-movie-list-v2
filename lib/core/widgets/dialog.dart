import 'package:flutter/material.dart';
import 'package:my_movie_list_v2/core/locale/locale.dart';

class CustomSimpleDialog {
  static void showMessageDialog({required BuildContext context, String? title = AppLocale.commonInfoText, required String message, String? positiveBtnLabel}) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? AppLocale.commonInfoText),
          content: Text(message),
          actions: [
            TextButton(
              child: Text(positiveBtnLabel ?? AppLocale.commonOkText),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
