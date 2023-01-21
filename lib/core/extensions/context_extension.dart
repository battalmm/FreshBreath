import 'package:flutter/material.dart';

extension PaddingExtension on BuildContext {
  EdgeInsetsGeometry get mediumPaddingAll => const EdgeInsets.all(16);

  EdgeInsetsGeometry get mediumPaddingVertical =>
      const EdgeInsets.symmetric(vertical: 20);

  EdgeInsetsGeometry get smallPaddingVertical =>
      const EdgeInsets.symmetric(vertical: 10);

  EdgeInsetsGeometry get mediumPaddingHorizontal =>
      const EdgeInsets.symmetric(horizontal: 20);

  EdgeInsetsGeometry get mediumPaddingOnlyLeft =>
      const EdgeInsets.only(left: 10);

  EdgeInsetsGeometry get mediumPaddingOnlyBottom =>
      const EdgeInsets.only(bottom: 16);
}

extension MediaQueryExtension on BuildContext {
  double get mediaQueryHeight => MediaQuery.of(this).size.height;

  double get mediaQueryWidth => MediaQuery.of(this).size.width;

  double get mediaQueryHeightMedium => MediaQuery.of(this).size.height / 5.5;
}
