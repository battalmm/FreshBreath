import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:smoking_application/core/base/view/base_view.dart';
import 'package:smoking_application/core/extensions/string_extension.dart';
import 'package:smoking_application/core/init/language/locale_keys.g.dart';
import 'package:smoking_application/core/init/notifier/theme_notifier.dart';
import 'package:smoking_application/product/widget/column_widget.dart';
import 'package:smoking_application/product/widget/header_and_body.dart';
import 'package:smoking_application/product/widget/row_widget.dart';
import 'package:smoking_application/product/widget/row_widget_third.dart';
import 'package:smoking_application/view/home/viewmodal/home_viewmodal.dart';

import '../../../core/extensions/context_extension.dart';
import '../../../core/init/language/language_manager.dart';
import '../../../core/init/navigation/navigation_route.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../product/enum/app_themes.dart';
import '../../../product/enum/languages.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeViewModal homeViewModal;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      onBuilder: _scaffoldBuild,
      onInitModal: () {
        homeViewModal = HomeViewModal();
        homeViewModal.init();
      },
    );
  }

  Widget _scaffoldBuild(BuildContext context) {
    return Scaffold(
      // BOTTOM NAVİGATİONI ÇIKAR
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        items: _bottomNavigationItems,
        onTap: (index) {
          switch (index) {
            case 0:
              homeViewModal.dispose();
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
      ),
      body: Padding(
        padding: context.mediumPaddingAll,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: _avatarHello,
            ),
            Expanded(
              flex: 2,
              child: _firstContainer(context),
            ),
            Expanded(
              flex: 2,
              child: _secondContainer(context),
            ),
            Expanded(
              flex: 2,
              child: _thirdContainer(context),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     context.setLocale(LanguageManager.instance.trLocale);
            //     LanguageManager.instance.saveLanguageOption(LanguageOptions.tr);
            //   },
            //   child: Text("tema dark"),
            // ),
          ],
        ),
      ),
    );
  }

  BackGroundCard _thirdContainer(BuildContext context) {
    return BackGroundCard(
      height: context.mediaQueryHeightMedium,
      iconPositionFromLeft: 25,
      paddingVertical: 20,
      stackedIcon: Icons.recycling,
      width: context.mediaQueryWidth,
      child: SingleChildScrollView(child: _bottomCol),
    );
  }

  BackGroundCard _secondContainer(BuildContext context) {
    return BackGroundCard(
      height: context.mediaQueryHeightMedium,
      iconPositionFromLeft: 25,
      paddingVertical: 20,
      stackedIcon: Icons.monitor_heart_outlined,
      width: context.mediaQueryWidth,
      child: SingleChildScrollView(child: _middleCol),
    );
  }

  BackGroundCard _firstContainer(BuildContext context) {
    return BackGroundCard(
      height: context.mediaQueryHeightMedium,
      iconPositionFromLeft: 25,
      paddingVertical: 20,
      stackedIcon: Icons.smoke_free,
      width: context.mediaQueryWidth,
      child: SingleChildScrollView(child: _topCol),
    );
  }

  Widget get _topCol => Column(
        children: [
          Padding(
            padding: context.smallPaddingVertical,
            child: AutoSizeText(LocaleKeys.home_passedTimeHeader.translate,
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.headline4!.fontSize)),
          ),
          Observer(
            builder: (context) => RowWidgethird(
              firstColumn: ColumnWidget(
                fontsizeBody: Theme.of(context).textTheme.headline6!.fontSize,
                fontsizeHeader: Theme.of(context).textTheme.headline4!.fontSize,
                data: homeViewModal.onScreen(homeViewModal.user?.getDays),
                dataType: LocaleKeys.home_day.translate,
              ),
              secondColumn: Padding(
                padding: context.mediumPaddingHorizontal,
                child: ColumnWidget(
                  fontsizeBody: Theme.of(context).textTheme.headline6!.fontSize,
                  fontsizeHeader:
                      Theme.of(context).textTheme.headline4!.fontSize,
                  data: homeViewModal.onScreen(homeViewModal.user?.getHours),
                  dataType: LocaleKeys.home_hour.translate,
                ),
              ),
              thirdColumn: ColumnWidget(
                fontsizeBody: Theme.of(context).textTheme.headline6!.fontSize,
                fontsizeHeader: Theme.of(context).textTheme.headline4!.fontSize,
                data: homeViewModal.onScreen(homeViewModal.user?.getMinutes),
                dataType: LocaleKeys.home_minute.translate,
              ),
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          )
        ],
      );

  Widget get _middleCol => Observer(
        builder: (context) => RowWidget(
          firstColumn: ColumnWidget(
            symetricPaddingVertical: context.mediumPaddingVertical,
            fontsizeBody: Theme.of(context).textTheme.headline4!.fontSize,
            fontsizeHeader: Theme.of(context).textTheme.headline4!.fontSize,
            data: LocaleKeys.home_notSmokedHeader.translate,
            dataType: homeViewModal.hourlySmokedCigaratteCalcullation(
                (homeViewModal.timeDifference?.inHours.toInt()) ?? 0),
          ),
          secondColumn: ColumnWidget(
            symetricPaddingVertical: context.mediumPaddingVertical,
            fontsizeBody: Theme.of(context).textTheme.headline4!.fontSize,
            fontsizeHeader: Theme.of(context).textTheme.headline4!.fontSize,
            data: LocaleKeys.home_healthHeader.translate,
            dataType:
                "${((homeViewModal.user?.getHours ?? 0) / 365 * 10).toStringAsFixed(2)}%",
          ),
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      );

  Widget get _bottomCol => Observer(
        builder: (context) => RowWidget(
          firstColumn: ColumnWidget(
            symetricPaddingVertical: context.mediumPaddingVertical,
            fontsizeBody: Theme.of(context).textTheme.headline4!.fontSize,
            fontsizeHeader: Theme.of(context).textTheme.headline4!.fontSize,
            data: LocaleKeys.home_savedTimeHeader.translate,
            dataType: homeViewModal.savedTimeCalculation(
              homeViewModal.hourlySmokedCigaratte,
              minutesLanguage: LocaleKeys.home_minuteOneChar.translate,
              hoursLanguage: LocaleKeys.home_hourOneChar.translate,
            ),
          ),
          secondColumn: ColumnWidget(
            symetricPaddingVertical: context.mediumPaddingVertical,
            fontsizeBody: Theme.of(context).textTheme.headline4!.fontSize,
            fontsizeHeader: Theme.of(context).textTheme.headline4!.fontSize,
            data: LocaleKeys.home_moneyHeader.translate,
            dataType: homeViewModal
                .moneyCalculation(homeViewModal.hourlySmokedCigaratte),
          ),
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      );

  Widget get _avatarHello {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 2 / 19,
            width: 70,
            color: Colors.transparent,
            child: CircleAvatar(),
          ),
          Padding(
            padding: context.mediumPaddingOnlyLeft,
            child: Text(
              "Hello, user",
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline5!.fontSize),
            ),
          ),
          const Expanded(child: SizedBox()),
          _healthInfoTextButton()
        ],
      ),
    );
  }

  TextButton _healthInfoTextButton() {
    return TextButton(
      onPressed: (() {
        NavigationService.instance
            .pushNamed(path: NavigationRoutes.information, args: [
          homeViewModal.timeDifferenceList?[0],
          homeViewModal.timeDifferenceList?[1],
          homeViewModal.timeDifferenceList?[2],
        ]);
      }),
      child: const Text(
        "Health info...",
        style: TextStyle(fontSize: 16),
      ),
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
}
