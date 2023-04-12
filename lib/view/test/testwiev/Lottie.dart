import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
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
      body: Column(
        children: [
          Center(
            child: CustomDropdownButton(
                titleText:
                    CacheManager.instance.getStringValue(SharedKeys.language) ??
                        "tr",
                onChanged: (items) {}),
          ),
        ],
      ),
    );
  }
}
