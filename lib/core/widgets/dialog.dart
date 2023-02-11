import 'package:flutter/material.dart';
import 'package:my_movie_list_v2/core/locale/locale.dart';

class CustomSimpleDialog {
  static void showMessageDialog({required BuildContext context, String? title = AppLocale.commonInfoText, required String message, String? positiveBtnLabel}) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? AppLocale.commonInfoText),
          content: const Text('A dialog is a type of modal window that\n'
              'appears in front of app content to\n'
              'provide critical information, or prompt\n'
              'for a decision to be made.'),
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
