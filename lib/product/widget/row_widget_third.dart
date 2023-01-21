import 'package:flutter/material.dart';

class RowWidgethird extends StatelessWidget {
  const RowWidgethird({
    Key? key,
    required this.firstColumn,
    required this.secondColumn,
    required this.thirdColumn,
    required this.mainAxisAlignment,
  }) : super(key: key);

  final MainAxisAlignment mainAxisAlignment;
  final Widget firstColumn;
  final Widget secondColumn;
  final Widget thirdColumn;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        firstColumn,
        secondColumn,
        thirdColumn,
      ],
    );
  }
}
