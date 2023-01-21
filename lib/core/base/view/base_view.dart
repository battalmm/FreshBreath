import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class BaseView<T extends Store> extends StatefulWidget {
  const BaseView(
      {Key? key,
      this.onDispose,
      required this.onBuilder,
      required this.onInitModal})
      : super(key: key);

  final Function() onInitModal;
  final VoidCallback? onDispose;
  final Widget Function(BuildContext context) onBuilder;

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState<T extends Store> extends State<BaseView<T>> {
  @override
  void initState() {
    super.initState();
    widget.onInitModal();
  }

  @override
  void dispose() {
    debugPrint('Disposing searchController and Widget!');
    if (widget.onDispose != null) widget.onDispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onBuilder(context);
  }
}
