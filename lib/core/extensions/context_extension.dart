import 'package:flutter/material.dart';

extension PaddingExtension on BuildContext {
  EdgeInsetsGeometry get mediumPaddingAll => const EdgeInsets.all(16);

  EdgeInsetsGeometry get mediumPaddingVertical =>
      const EdgeInsets.symmetric(vertical: 20);

  EdgeInsetsGeometry get mediumPaddingHorizontal =>
      const EdgeInsets.symmetric(horizontal: 20);

  EdgeInsetsGeometry get mediumPaddingOnlyLeft =>
      const EdgeInsets.only(left: 10);

  EdgeInsetsGeometry get mediumPaddingOnlyRight =>
      const EdgeInsets.only(right: 10);

  EdgeInsetsGeometry get mediumPaddingOnlyBottom =>
      const EdgeInsets.only(bottom: 16);

  EdgeInsetsGeometry get smallPaddingAll => const EdgeInsets.all(8);

  EdgeInsetsGeometry get smallPaddingVertical =>
      const EdgeInsets.symmetric(vertical: 10);
}

extension MediaQueryExtension on BuildContext {
  double get mediaQueryHeight => MediaQuery.of(this).size.height;

  double get mediaQueryWidth => MediaQuery.of(this).size.width;

  double get mediaQueryHeightMedium => MediaQuery.of(this).size.height / 5.5;

  double get mediaQueryHeightSmall => MediaQuery.of(this).size.height / 12;
}

extension BorderRadiusExtension on BuildContext {
  double get mediumCircularBorderRadius => 36;
}

extension CircleProgress on BuildContext {
  double get mediumLineWidth => 13.0;
  double get smallLineWidth => 5.0;
  double get mediumCircularRadius => 60.0;
  double get smallCircularRadius => 24.0;
}
