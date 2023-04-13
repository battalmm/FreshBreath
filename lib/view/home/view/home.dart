import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:smoking_application/core/base/view/base_view.dart';
import 'package:smoking_application/core/extensions/string_extension.dart';
import 'package:smoking_application/core/init/language/locale_keys.g.dart';
import 'package:smoking_application/product/widget/column_widget.dart';
import 'package:smoking_application/product/widget/header_and_body.dart';
import 'package:smoking_application/product/widget/row_widget.dart';
import 'package:smoking_application/product/widget/row_widget_third.dart';
import 'package:smoking_application/view/home/viewmodal/home_viewmodal.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/init/navigation/navigation_route.dart';
import '../../../core/init/navigation/navigation_service.dart';

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
      onDispose: () {
        homeViewModal.dispose();
      },
    );
  }

  Widget _scaffoldBuild(BuildContext context) {
    return Scaffold(
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
                    fontSize:
                        Theme.of(context).textTheme.headlineMedium!.fontSize)),
          ),
          Observer(
            builder: (context) => RowWidgethird(
              firstColumn: ColumnWidget(
                fontsizeBody: Theme.of(context).textTheme.titleLarge!.fontSize,
                fontsizeHeader:
                    Theme.of(context).textTheme.headlineMedium!.fontSize,
                data: homeViewModal.onScreen(homeViewModal.user?.getDays),
                dataType: LocaleKeys.home_day.translate,
              ),
              secondColumn: Padding(
                padding: context.mediumPaddingHorizontal,
                child: ColumnWidget(
                  fontsizeBody:
                      Theme.of(context).textTheme.titleLarge!.fontSize,
                  fontsizeHeader:
                      Theme.of(context).textTheme.headlineMedium!.fontSize,
                  data: homeViewModal.onScreen(homeViewModal.user?.getHours),
                  dataType: LocaleKeys.home_hour.translate,
                ),
              ),
              thirdColumn: ColumnWidget(
                fontsizeBody: Theme.of(context).textTheme.titleLarge!.fontSize,
                fontsizeHeader:
                    Theme.of(context).textTheme.headlineMedium!.fontSize,
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
            fontsizeBody: Theme.of(context).textTheme.headlineMedium!.fontSize,
            fontsizeHeader:
                Theme.of(context).textTheme.headlineMedium!.fontSize,
            data: LocaleKeys.home_notSmokedHeader.translate,
            dataType: homeViewModal.hourlySmokedCigaratteCalcullation(
                (homeViewModal.timeDifference?.inHours.toInt()) ?? 0),
          ),
          secondColumn: ColumnWidget(
            symetricPaddingVertical: context.mediumPaddingVertical,
            fontsizeBody: Theme.of(context).textTheme.headlineMedium!.fontSize,
            fontsizeHeader:
                Theme.of(context).textTheme.headlineMedium!.fontSize,
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
            fontsizeBody: Theme.of(context).textTheme.headlineMedium!.fontSize,
            fontsizeHeader:
                Theme.of(context).textTheme.headlineMedium!.fontSize,
            data: LocaleKeys.home_savedTimeHeader.translate,
            dataType: homeViewModal.savedTimeCalculation(
              homeViewModal.hourlySmokedCigaratte,
              minutesLanguage: LocaleKeys.home_minuteOneChar.translate,
              hoursLanguage: LocaleKeys.home_hourOneChar.translate,
            ),
          ),
          secondColumn: ColumnWidget(
            symetricPaddingVertical: context.mediumPaddingVertical,
            fontsizeBody: Theme.of(context).textTheme.headlineMedium!.fontSize,
            fontsizeHeader:
                Theme.of(context).textTheme.headlineMedium!.fontSize,
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
                  fontSize:
                      Theme.of(context).textTheme.headlineSmall!.fontSize),
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
      onPressed: () {
        NavigationService.instance.pushNamed(
          path: NavigationRoutes.testView,
        );
      },
      child: const Text(
        "Attempts...",
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
