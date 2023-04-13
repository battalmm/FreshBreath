part of "options_view.dart";

// ****************** //
// Widgets

BackGroundCard _backGroundCard({
  required BuildContext context,
  required String text,
  required IconData icon,
  Function()? onTap,
  required bool isClickable,
  Widget? rightSideIcon,
}) {
  return BackGroundCard(
    height: context.mediaQueryHeightSmall,
    iconPositionFromLeft: 25,
    paddingVertical: 20,
    stackedIcon: icon,
    width: context.mediaQueryWidth,
    child: _insideOfOptionsColumnRow(
        isClickable: isClickable,
        context: context,
        text: text,
        onTap: onTap,
        rightSideIcon: rightSideIcon),
  );
}

Center _insideOfOptionsColumnRow({
  required BuildContext context,
  required String text,
  Function()? onTap,
  required bool isClickable,
  Widget? rightSideIcon,
}) {
  return Center(
    child: Stack(
      children: [
        Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize),
          ),
        ),
        Center(
          child: Row(
            children: [
              const Spacer(),
              Padding(
                padding: context.mediumPaddingOnlyRight,
                child: rightSideIcon ?? const Icon(Icons.arrow_circle_right),
              ),
            ],
          ),
        ),
        isClickable
            ? InkWell(
                onTap: onTap,
                highlightColor: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(25.0),
                radius: 0, // tıklama efektinin maksimum yarıçapı
              )
            : const SizedBox(
                height: 0,
                width: 0,
              )
      ],
    ),
  );
}

BackGroundCard _backGroundCardForTheme({
  required BuildContext context,
  required String text,
  required IconData icon,
  required Function() onTap,
  Widget? rightSideIcon,
}) {
  return BackGroundCard(
    height: context.mediaQueryHeightSmall,
    iconPositionFromLeft: 25,
    paddingVertical: 20,
    stackedIcon: icon,
    width: context.mediaQueryWidth,
    child: Center(
      child: Stack(
        children: [
          Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize:
                      Theme.of(context).textTheme.headlineSmall!.fontSize),
            ),
          ),
          Center(
            child: Row(
              children: [
                const Spacer(),
                InkWell(
                  onTap: onTap,
                  highlightColor: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(25.0),
                  radius: 0,
                  child: rightSideIcon ?? const Icon(Icons.arrow_circle_right),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _languageElevatedButton(BuildContext context) {
  return Padding(
    padding: context.mediumPaddingHorizontal,
    child: CustomDropdownButton(
        titleText:
            CacheManager.instance.getStringValue(SharedKeys.language) ?? "tr",
        onChanged: (items) {
          languageOptions(context, items);
        }),
  );
}

Widget _lottieAsset(BuildContext context, AnimationController controller) {
  return Lottie.asset(
    LottieItems.themeChangeAnimationIcon.getLottie,
    repeat: false,
    controller: controller,
    height: context.mediaQueryHeightSmall,
    width: context.mediaQueryHeightSmall,
    onLoaded: (p0) => onLoadAnimation(controller),
  );
}

dynamic _restartCounter(BuildContext context) {
  return () async {
    bool _isRestart = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return RestartDialog(
            context: context,
            cancelText: LocaleKeys
                .options_restartDialog_restartDialogCancelButton.translate,
            title:
                LocaleKeys.options_restartDialog_restartDialogTitle.translate,
            content:
                LocaleKeys.options_restartDialog_restartDialogBody.translate,
            okayText: LocaleKeys
                .options_restartDialog_restartDialogOkayButton.translate,
          );
        });
    _isRestart ? refreshPickedTimeAndSave() : null;
  };
}
