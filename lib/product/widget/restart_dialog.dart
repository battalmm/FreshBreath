import 'package:flutter/material.dart';

class RestartDialog extends AlertDialog {
  RestartDialog({
    Key? key,
    required BuildContext context,
    String? cancelText,
    String? okayText,
    String? title,
    String? content,
  }) : super(
          key: key,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text(cancelText ?? "Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text(okayText ?? "Yes"),
            ),
          ],
          title: Text(title ?? "Restart"),
          content: Text(content ?? "Are you sure?"),
        );
}
