import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({
    Key? key,
    required this.firstColumn,
    required this.secondColumn,
    required this.mainAxisAlignment,
  }) : super(key: key);

  final MainAxisAlignment mainAxisAlignment;
  final Widget firstColumn;
  final Widget secondColumn;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        firstColumn,
        secondColumn,
      ],
    );
  }
}
