import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:smoking_application/core/base/view/base_view.dart';
import 'package:smoking_application/core/extensions/string_extension.dart';
import 'package:smoking_application/core/init/language/locale_keys.g.dart';
import 'package:smoking_application/core/init/navigation/navigation_service.dart';
import 'package:smoking_application/view/information/viewmodal/informations_viewmodal.dart';
import '../../../core/base/state/base_state.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../product/widget/bottom_sheet.dart';

class InformationsView extends StatefulWidget {
  const InformationsView({Key? key}) : super(key: key);

  @override
  State<InformationsView> createState() => _InformationsViewState();
}

class _InformationsViewState extends BaseState<InformationsView> {
  late InformationsViewModal informationsViewModal;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      onBuilder: _scaffoldBody,
      onInitModal: () {
        informationsViewModal = InformationsViewModal();
        informationsViewModal.init();
      },
      onDispose: () {},
    );
  }

  Widget _scaffoldBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Informations_informationsHeader.translate),
        centerTitle: true,
      ),
      body: _listViewBuilder(),
    );
  }

  ListView _listViewBuilder() {
    return ListView.builder(
      controller: informationsViewModal.scrollController,
      addAutomaticKeepAlives: true,
      itemCount: informationsViewModal.timeAndHealthInfos.length,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          child: Card(
            child: _listTile(context, index),
          ),
        );
      },
    );
  }

  ListTile _listTile(BuildContext context, int index) {
    return ListTile(
      onTap: (() {
        _bottomSheet(context, index);
      }),
      leading: _circlePercentIndicator(
        index,
        context,
        informationsViewModal.timeCalculation(index),
      ),
      subtitle: Text(
          informationsViewModal.timeAndHealthInfos.values.elementAt(index)),
      title:
          Text(informationsViewModal.timeAndHealthInfos.keys.elementAt(index)),
      trailing: const Icon(Icons.keyboard_arrow_right_rounded),
    );
  }

  Future<dynamic> _bottomSheet(BuildContext context, int index) {
    return showModalBottomSheet(
      context: context,
      useSafeArea: false,
      isDismissible: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(context.mediumCircularBorderRadius),
        ),
      ),
      builder: (context) {
        return CustomSheet(
          header:
              informationsViewModal.timeAndHealthInfos.keys.elementAt(index),
          text:
              informationsViewModal.timeAndHealthInfos.values.elementAt(index),
          circleProgressIndicator: _circlePercentIndicator(
            index,
            context,
            informationsViewModal.timeCalculation(index),
            lineWidth: context.mediumLineWidth,
            radius: context.mediumCircularRadius,
            centerTextFontSize:
                Theme.of(context).textTheme.titleLarge!.fontSize,
          ),
        );
      },
    );
  }

  CircularPercentIndicator _circlePercentIndicator(
    int index,
    BuildContext context,
    double percent, {
    double? radius,
    double? lineWidth,
    double? centerTextFontSize,
  }) {
    return CircularPercentIndicator(
      addAutomaticKeepAlive: false,
      curve: Curves.easeOut,
      animationDuration: 2000,
      animation: true,
      radius: radius ?? context.smallCircularRadius,
      lineWidth: lineWidth ?? context.smallLineWidth,
      percent: percent,
      progressColor: Theme.of(context).colorScheme.primary,
      center: Text(
        "${(percent * 100).toStringAsFixed(0)}%",
        style: TextStyle(
            fontSize: centerTextFontSize ??
                Theme.of(context).textTheme.bodyMedium!.fontSize),
      ),
    );
  }
}
