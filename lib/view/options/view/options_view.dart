import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:smoking_application/core/base/view/base_view.dart';
import 'package:smoking_application/core/extensions/context_extension.dart';
import 'package:smoking_application/core/extensions/string_extension.dart';
import 'package:smoking_application/product/enum/lottie_path.dart';
import 'package:smoking_application/product/widget/dropdown_button.dart';
import '../../../core/extensions/duration_extension.dart';
import '../../../core/init/cache/cache_manager.dart';
import '../../../core/init/cache/shared_keys.dart';
import '../../../core/init/language/language_manager.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../core/init/navigation/navigation_route.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../core/init/notifier/theme_notifier.dart';
import '../../../product/enum/app_themes.dart';
import '../../../product/enum/languages.dart';
import '../../../product/widget/header_and_body.dart';
import '../../../product/widget/restart_dialog.dart';

part 'options_view_part.dart';

class OptionsView extends StatefulWidget {
  const OptionsView({Key? key}) : super(key: key);

  @override
  State<OptionsView> createState() => _OptionsViewState();
}

class _OptionsViewState extends State<OptionsView>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      onInitModal: () {
        controller = AnimationController(
            vsync: this, duration: const Duration().themeDurationZero);
      },
      onBuilder: (context) => _scaffoldBuild(context),
      onDispose: () {
        controller.dispose();
      },
    );
  }

  Scaffold _scaffoldBuild(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // WİLL CHANGE
          title: Text(LocaleKeys.options_optionsTitle.translate),
        ),
        body: Padding(
            padding: context.mediumPaddingAll,
            child: Column(children: [
              Expanded(
                flex: 2,
                child: _firstContainer(
                  context: context,
                  text: LocaleKeys.options_optionsLanguage.translate,
                ),
              ),
              Expanded(
                flex: 2,
                child: _secondContainer(
                  context: context,
                  text: LocaleKeys.options_optionsInformations.translate,
                ),
              ),
              Expanded(
                flex: 2,
                child: _thirdContainer(
                  context: context,
                  text: LocaleKeys.options_optionsTheme.translate,
                  controller: controller,
                ),
              ),
              Expanded(
                flex: 2,
                child: _fourthContainer(
                  context: context,
                  text: LocaleKeys.options_optionsRestart.translate,
                ),
              ),
            ])));
  }

  BackGroundCard _firstContainer(
      {required BuildContext context, required String text}) {
    return _backGroundCard(
      context: context,
      text: text,
      icon: Icons.translate,
      isClickable: false,
      rightSideIcon: _languageElevatedButton(context),
    );
  }

  BackGroundCard _secondContainer(
      {required BuildContext context, required String text}) {
    return _backGroundCard(
      context: context,
      text: text,
      icon: Icons.settings,
      isClickable: true,
      onTap: () => navigateToSettings(),
    );
  }

  BackGroundCard _thirdContainer(
      {required BuildContext context,
      required String text,
      required AnimationController controller}) {
    return _backGroundCardForTheme(
      context: context,
      text: text,
      icon: Icons.light_mode,
      rightSideIcon: _lottieAsset(context, controller),
      onTap: () => themeSettings(context, controller),
    );
  }

  BackGroundCard _fourthContainer(
      {required BuildContext context, required String text}) {
    return _backGroundCard(
        context: context,
        isClickable: true,
        text: text,
        icon: Icons.restart_alt,
        onTap: _restartCounter(context));
  }
}

// ****************** //
// Logics

Future<void> refreshPickedTimeAndSave() async {
  DateTime? pickedTime;
  pickedTime = DateTime.now();

  await CacheManager.instance
      .setStringValue(SharedKeys.pickedTime, pickedTime.toString());
}

void themeSettings(BuildContext context, AnimationController controller) {
  // Seperate from here
  bool _themeController =
      CacheManager.instance.getStringValue(SharedKeys.theme) == "LightTheme"
          ? true
          : false;

  if (_themeController) {
    Provider.of<ThemeNotifier>(context, listen: false)
        .changeTheme(AppThemes.dark);
    _themeController = !_themeController;
  } else {
    Provider.of<ThemeNotifier>(context, listen: false)
        .changeTheme(AppThemes.light);
    _themeController = !_themeController;
  }
  controller.animateTo(_themeController ? 1 : 0.5);
}

void onLoadAnimation(AnimationController controller) {
  bool _themeController =
      CacheManager.instance.getStringValue(SharedKeys.theme) == "LightTheme"
          ? true
          : false;

  controller.animateTo(_themeController ? 1 : 0.5);
  controller.duration = const Duration().themeDurationOne;
}

void navigateToSettings() {
  NavigationService.instance
      .pushNamed(path: NavigationRoutes.userInformationView);
}

void languageOptions(BuildContext context, String? localeCode) {
  switch (localeCode) {
    case "tr":
      context.setLocale(LanguageManager.instance.trLocale);
      LanguageManager.instance.saveLanguageOption(LanguageOptions.tr);
      break;

    case "en":
      context.setLocale(LanguageManager.instance.enLocale);
      LanguageManager.instance.saveLanguageOption(LanguageOptions.en);
      break;

    default:
      context.setLocale(LanguageManager.instance.trLocale);
      LanguageManager.instance.saveLanguageOption(LanguageOptions.tr);
      break;
  }
}
