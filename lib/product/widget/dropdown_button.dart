import 'package:flutter/material.dart';
import 'package:smoking_application/core/init/language/language_manager.dart';

class CustomDropdownButton extends StatefulWidget {
  CustomDropdownButton(
      {Key? key,
      this.selectedItems,
      required this.titleText,
      required this.onChanged})
      : super(key: key);
  List<String> items = LanguageManager.instance.getLanguageNames;
  final String? selectedItems;
  final String titleText;
  final void Function(String? model) onChanged;

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? _selectedItems;

  @override
  void initState() {
    super.initState();
    _selectedItems = widget.selectedItems;
  }

  void _changeSelectItems(String? data) {
    setState(() {
      _selectedItems = data;
    });
    widget.onChanged(data);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        icon:
            Icon(Icons.language, color: Theme.of(context).colorScheme.primary),
        alignment: AlignmentDirectional.center,
        dropdownColor: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(32),
        hint: Text(widget.titleText),
        value: _selectedItems,
        onChanged: _changeSelectItems,
        items: widget.items.map((e) {
          return _dropdownMenuItem(e);
        }).toList());
  }

  DropdownMenuItem<String> _dropdownMenuItem(String e) =>
      DropdownMenuItem(value: e, child: Text(e.toString()));
}
