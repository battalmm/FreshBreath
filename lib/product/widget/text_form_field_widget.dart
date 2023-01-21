import 'package:flutter/material.dart';

class TextFormFieldWidget extends TextFormField {
  TextFormFieldWidget({
    this.labelText,
    this.suffixText,
    this.suffixTextData,
    Key? key,
    required this.textController,
  }) : super(
          key: key,
          controller: textController,
          decoration: InputDecoration(
            labelText: labelText ?? "",
            suffixText: "${suffixText ?? ""} ${suffixTextData ?? ""}",
          ),
        );

  final TextEditingController textController;
  final String? labelText;
  final String? suffixTextData;
  final String? suffixText;
}
