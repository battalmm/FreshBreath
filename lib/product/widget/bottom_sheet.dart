import 'package:flutter/material.dart';
import 'package:smoking_application/core/extensions/context_extension.dart';

import '../../core/init/navigation/navigation_service.dart';

class CustomSheet extends StatelessWidget {
  const CustomSheet({
    Key? key,
    this.text,
    this.header,
    this.circleProgressIndicator,
  }) : super(key: key);

  final String? text;
  final String? header;
  final Widget? circleProgressIndicator;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SheetHeader(
          header: header,
        ),
        Expanded(
            child: DetailedHealthInformations(
          detailedText: text,
          circleProgressIndicator: circleProgressIndicator,
        ))
      ],
    );
  }
}

class SheetHeader extends StatelessWidget {
  const SheetHeader({Key? key, String? header})
      : header = header ?? "NULL_HEADER",
        super(key: key);

  final String header;

  @override
  Widget build(BuildContext context) {
    final _headersVerticalAllignment = context.mediaQueryHeightSmall / 3;
    return SizedBox(
      height: context.mediaQueryHeightSmall,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: _headersVerticalAllignment,
            child: Text(
              header,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
              ),
            ),
          ),
          Positioned(
            top: _headersVerticalAllignment,
            right: context.mediaQueryWidth / 15,
            child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  NavigationService.instance.pop();
                },
                child: const Icon(
                  Icons.cancel,
                  size: 30,
                )),
          )
        ],
      ),
    );
  }
}

class DetailedHealthInformations extends StatelessWidget {
  const DetailedHealthInformations({
    Key? key,
    String? detailedText,
    Widget? circleProgressIndicator,
  })  : detailedText = detailedText ?? "Duration",
        circleProgressIndicator = circleProgressIndicator ?? const SizedBox(),
        super(key: key);

  final String detailedText;
  final Widget circleProgressIndicator;

  @override
  Widget build(BuildContext context) {
    // Bu kısmı hallet
    return SingleChildScrollView(
      child: Padding(
        padding: context.mediumPaddingAll,
        child: Column(
          children: [
            Text(
              detailedText,
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleLarge!.fontSize),
            ),
            Padding(
              padding: context.mediumPaddingAll,
              child: circleProgressIndicator,
            ),
          ],
        ),
      ),
    );
  }
}
