import 'package:flutter/material.dart';

//
class ButtonWidget extends Container {
  ButtonWidget({
    required this.onPressed,
    this.borderRadiusCircular,
    required this.height,
    required this.width,
    this.text,
    Key? key,
  }) : super(
            key: key,
            height: height,
            width: width,
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              borderRadiusCircular ?? 18)))),
              onPressed: onPressed,
              child: text,
            ));

  final double height;
  final double width;
  final double? borderRadiusCircular;
  final Widget? text;
  void Function()? onPressed;
}
