enum LottieItems { themeChangeAnimationIcon }

extension LottieItemsExtension on LottieItems {
  String _path() {
    switch (this) {
      case LottieItems.themeChangeAnimationIcon:
        return "lottie_theme_change.json";
    }
  }

  String get getLottie => "assets/lottie/${_path()}";
}
