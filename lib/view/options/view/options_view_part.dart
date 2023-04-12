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
              Spacer(),
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
                Spacer(),
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
