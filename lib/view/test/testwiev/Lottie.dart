import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:smoking_application/core/init/navigation/navigation_service.dart';
import 'package:smoking_application/product/enum/lottie_path.dart';

import '../../../core/init/cache/cache_manager.dart';
import '../../../core/init/cache/shared_keys.dart';
import '../../../product/widget/dropdown_button.dart';

class LottieTheme extends StatefulWidget {
  const LottieTheme({Key? key}) : super(key: key);

  @override
  State<LottieTheme> createState() => _LottieThemeState();
}

class _LottieThemeState extends State<LottieTheme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => RestartDialog(context: context),
          );
        },
      ),
    );
  }
}

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
