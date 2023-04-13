import 'package:flutter/material.dart';

class BackGroundCard extends StatelessWidget {
  const BackGroundCard(
      {Key? key,
      this.child,
      required this.stackedIcon,
      required this.width,
      required this.height,
      required this.iconPositionFromLeft,
      required this.paddingVertical,
      this.backGroundColor,
      this.blurColor,
      this.blurRadius,
      this.offset})
      : super(key: key);

  final Widget? child;
  final Color? backGroundColor;
  final Color? blurColor;
  final double? blurRadius;
  final Offset? offset;

  final IconData stackedIcon;
  final double width;
  final double height;
  final double iconPositionFromLeft;
  final double paddingVertical;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: paddingVertical),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color:
                  backGroundColor ?? Theme.of(context).colorScheme.background,
              boxShadow: [
                BoxShadow(
                  color: blurColor ?? Theme.of(context).colorScheme.primary,
                  offset: offset ?? const Offset(2, 2),
                  blurRadius: blurRadius ?? 5,
                )
              ]),
          height: height,
          width: width,
          child: child,
        ),
      ),
      Positioned(
        left: iconPositionFromLeft,
        child: Icon(
          stackedIcon,
          size: paddingVertical * 2,
        ),
      ),
    ]);
  }
}
