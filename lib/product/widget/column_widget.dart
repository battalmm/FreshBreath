import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({
    Key? key,
    this.dataType,
    required this.data,
    this.fontsizeHeader,
    this.fontsizeBody,
    this.symetricPaddingVertical,
    this.circleWidget,
  }) : super(key: key);

  final String data;

  final String? dataType;
  final EdgeInsetsGeometry? symetricPaddingVertical;
  final double? fontsizeHeader;
  final double? fontsizeBody;
  final Widget? circleWidget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: symetricPaddingVertical ?? const EdgeInsets.all(0),
            child: Text(data, style: TextStyle(fontSize: fontsizeHeader)),
          ),
          circleWidget ??
              Text(dataType!, style: TextStyle(fontSize: fontsizeBody)),
        ],
      ),
    );
  }
}
