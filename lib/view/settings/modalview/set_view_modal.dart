import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:smoking_application/core/base/base_wiev_modal/base_view_modal.dart';
import 'package:smoking_application/core/init/cache/cache_manager.dart';
import 'package:smoking_application/core/init/cache/shared_keys.dart';

part 'set_view_modal.g.dart';

class SettingsViewModal = _SettingsViewModalBase with _$SettingsViewModal;

abstract class _SettingsViewModalBase with Store, BaseViewModel {
  @override
  void init() {}

  @observable
  bool isLoading = false;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  void setCacheItems(
      TextEditingController controller, SharedKeys key, String currentData) {
    CacheManager.instance.setIntValue(
      key,
      int.tryParse(controller.text) ?? int.tryParse(currentData) ?? 0,
    );
  }
}
