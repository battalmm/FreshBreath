import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smoking_application/core/base/view/base_view.dart';
import 'package:smoking_application/core/extensions/context_extension.dart';

import '../../../product/widget/header_and_body.dart';

class OptionsView extends StatefulWidget {
  const OptionsView({Key? key}) : super(key: key);

  @override
  State<OptionsView> createState() => _OptionsViewState();
}

class _OptionsViewState extends State<OptionsView> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      onBuilder: _scaffoldBuild,
      onInitModal: () {},
    );
  }
}

Widget _scaffoldBuild(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        // WİLL CHANGE
        title: Text("Options"),
        toolbarHeight: 50,
      ),
      body: Padding(
          padding: context.mediumPaddingAll,
          child: Column(children: [
            Expanded(
              flex: 2,
              child: _firstContainer(
                context: context,
                text: "Language",
              ),
            ),
            Expanded(
              flex: 2,
              child: _secondContainer(
                context: context,
                text: "Informations",
              ),
            ),
            Expanded(
              flex: 2,
              child: _thirdContainer(
                context: context,
                text: "Theme",
              ),
            ),
            Expanded(
              flex: 2,
              child: _fourthContainer(
                context: context,
                text: "I smoked restart.",
              ),
            ),
          ])));
}

Widget _firstContainer({required BuildContext context, required String text}) {
  return _backGroundCard(
    context: context,
    text: text,
    icon: Icons.translate,
  );
}

Widget _secondContainer({required BuildContext context, required String text}) {
  return _backGroundCard(
    context: context,
    text: text,
    icon: Icons.settings,
  );
}

Widget _thirdContainer({required BuildContext context, required String text}) {
  return _backGroundCard(
    context: context,
    text: text,
    icon: Icons.light_mode,
  );
}

Widget _fourthContainer({required BuildContext context, required String text}) {
  return _backGroundCard(
    context: context,
    text: text,
    icon: Icons.restart_alt,
  );
}

Widget _backGroundCard({
  required BuildContext context,
  required String text,
  required IconData icon,
}) {
  return BackGroundCard(
    height: context.mediaQueryHeightSmall,
    iconPositionFromLeft: 25,
    paddingVertical: 20,
    stackedIcon: icon,
    width: context.mediaQueryWidth,
    child: _insideOfOptionsColumnRow(
      context: context,
      text: text,
    ),
  );
}

Widget _insideOfOptionsColumnRow(
    {required BuildContext context, required String text}) {
  return Center(
      child: Stack(
    children: [
      Center(
        child: Text(text),
      ),
      Center(
        child: Row(
          children: [
            const Spacer(),
            Padding(
              padding: context.mediumPaddingOnlyRight,
              child: const Icon(Icons.arrow_circle_right),
            ),
          ],
        ),
      )
    ],
  ));
}
