import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:smoking_application/core/base/view/base_view.dart';
import 'package:smoking_application/core/init/cache/cache_manager.dart';
import 'package:smoking_application/core/init/cache/shared_keys.dart';
import 'package:smoking_application/product/enum/languages.dart';

import '../../../core/init/language/language_manager.dart';
import '../../../core/init/navigation/navigation_route.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../core/init/notifier/theme_notifier.dart';
import '../../../product/enum/app_themes.dart';

class TestView2 extends StatefulWidget {
  const TestView2({
    Key? key,
  }) : super(key: key);

  @override
  State<TestView2> createState() => _TestView2State();
}

class _TestView2State extends State<TestView2> {
  bool _themeController =
      CacheManager.instance.getStringValue(SharedKeys.theme) == "LightTheme"
          ? true
          : false;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      onBuilder: _scaffoldBuild,
      onInitModal: () {},
    );
  }

  Widget _scaffoldBuild(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(),
      bottomNavigationBar: _bottombar(context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _themeMethod(context),
              infoMethod(),
              languageMethod(context),
              trLanguage(context),
              enLanguage(context),
              restartMethod(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _themeMethod(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: ElevatedButton(
          onPressed: () {
            if (_themeController) {
              Provider.of<ThemeNotifier>(context, listen: false)
                  .changeTheme(AppThemes.dark);
              _themeController = !_themeController;
            } else {
              Provider.of<ThemeNotifier>(context, listen: false)
                  .changeTheme(AppThemes.light);
              _themeController = !_themeController;
            }
          },
          child: const Text("tema"),
        ),
      ),
    );
  }

  Widget infoMethod() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: ElevatedButton(
          onPressed: () {
            NavigationService.instance
                .pushNamed(path: NavigationRoutes.settings);
          },
          child: const Text("informations"),
        ),
      ),
    );
  }

  Widget languageMethod(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: ElevatedButton(
          onPressed: () {
            // Alert ekranı açılır ve dil seçilir
          },
          child: const Text("language"),
        ),
      ),
    );
  }

  Widget trLanguage(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          context.setLocale(LanguageManager.instance.trLocale);
          LanguageManager.instance.saveLanguageOption(LanguageOptions.tr);
        },
        child: const Text("turkish"),
      ),
    );
  }

  Widget enLanguage(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          context.setLocale(LanguageManager.instance.enLocale);
          LanguageManager.instance.saveLanguageOption(LanguageOptions.en);
        },
        child: const Text("english"),
      ),
    );
  }

  Widget restartMethod() => Expanded(child: Text("restart"));
}

///////************************************* */

BottomNavigationBar _bottombar(BuildContext context) {
  return BottomNavigationBar(
    showUnselectedLabels: false,
    showSelectedLabels: false,
    type: BottomNavigationBarType.fixed,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    items: _bottomNavigationItems,
    onTap: (index) {
      switch (index) {
        case 0:
          NavigationService.instance.pushtest(path: NavigationRoutes.home);
          break;
        case 1:
          NavigationService.instance
              .pushNamedClear(path: NavigationRoutes.test);
          break;
        case 2:
          NavigationService.instance
              .pushNamedClear(path: NavigationRoutes.settings);

          break;
      }
    },
  );
}

List<BottomNavigationBarItem> get _bottomNavigationItems {
  return const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.assignment_outlined),
      label: "Notes",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "Settings",
    ),
  ];
}
