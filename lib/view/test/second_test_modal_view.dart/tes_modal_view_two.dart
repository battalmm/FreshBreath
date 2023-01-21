import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:smoking_application/core/init/cache/cache_manager.dart';
import 'package:smoking_application/core/init/cache/shared_keys.dart';

part 'tes_modal_view_two.g.dart';

class SecondTestView = _SecondTestViewBase with _$SecondTestView;

abstract class _SecondTestViewBase with Store {
  @observable
  DateTime? pickedTime;

  setCacheItems(TextEditingController controller, SharedKeys key) {
    CacheManager.instance.setIntValue(
      key,
      int.tryParse(controller.text) ?? 0,
    );
  }

  @action
  Future<void> refreshPickedTimeAndSave() async {
    pickedTime = DateTime.now();

    await CacheManager.instance
        .setStringValue(SharedKeys.pickedTime, pickedTime.toString());
  }
}
