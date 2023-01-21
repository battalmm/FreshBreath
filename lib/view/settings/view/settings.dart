import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:smoking_application/core/base/view/base_view.dart';
import 'package:smoking_application/core/extensions/string_extension.dart';
import 'package:smoking_application/core/init/cache/cache_manager.dart';
import 'package:smoking_application/core/init/cache/shared_keys.dart';
import 'package:smoking_application/core/init/language/locale_keys.g.dart';
import 'package:smoking_application/core/init/navigation/navigation_service.dart';
import 'package:smoking_application/view/settings/modalview/set_view_modal.dart';
import '../../../core/base/state/base_state.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../product/widget/button_widget.dart';
import '../../../product/widget/text_form_field_widget.dart';

part 'settings_part.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends BaseState<SettingsView> with ControllerMixin {
  late SettingsViewModal _settingsViewModal;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      onBuilder: _scaffoldBuild,
      onInitModal: () {
        _settingsViewModal = SettingsViewModal();
        init();
      },
      onDispose: () {
        _disposeController();
      },
    );
  }

  Widget _scaffoldBuild(BuildContext context) {
    return Scaffold(
      appBar: MediaQuery.of(context).size.height > 640.0
          ? AppBar(
              title: Text(LocaleKeys.settings_settingsHeader.translate),
              centerTitle: true,
              toolbarHeight: 45,
            )
          : null,
      body: Padding(
        padding: context.mediumPaddingAll,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _dailySmokedArea,
                  _packageCountArea,
                  _packagePrice,
                  _smokingTime,
                ],
              ),
            ),
            const Spacer(flex: 1),
            Padding(
              padding: context.mediumPaddingOnlyBottom,
              child: _saveButton(context),
            ),
          ],
        ),
      ),
    );
  }

  ButtonWidget _saveButton(BuildContext context) {
    return ButtonWidget(
      text: _saveButtonText,
      width: context.mediaQueryWidth,
      height: 50,
      onPressed: () async {
        _settingsViewModal.changeLoading();
        // debugPrint(_packageCountController.text);
        _settingsViewModal.setCacheItems(
          _packageCountController,
          SharedKeys.countPackage,
          _getCacheData(SharedKeys.countPackage),
        );

        // debugPrint(_savedMoneyController.text);
        _settingsViewModal.setCacheItems(
          _savedMoneyController,
          SharedKeys.pricePackage,
          _getCacheData(SharedKeys.pricePackage),
        );

        // debugPrint(_smokedCountController.text);
        _settingsViewModal.setCacheItems(
          _smokedCountController,
          SharedKeys.dailySmoked,
          _getCacheData(SharedKeys.dailySmoked),
        );

        // debugPrint(_passedTimeController.text);
        _settingsViewModal.setCacheItems(
          _passedTimeController,
          SharedKeys.smokingTime,
          _getCacheData(SharedKeys.smokingTime),
        );
        await Future.delayed(const Duration(milliseconds: 500));
        _settingsViewModal.changeLoading();
        NavigationService.instance.pop();
      },
    );
  }

  TextFormFieldWidget get _smokingTime {
    return TextFormFieldWidget(
        suffixTextData: _getCacheData(SharedKeys.smokingTime),
        suffixText: LocaleKeys.settings_currentValue.translate,
        textController: _passedTimeController,
        labelText: LocaleKeys.settings_smokeDuration.translate);
  }

  TextFormFieldWidget get _packagePrice {
    return TextFormFieldWidget(
        suffixTextData: _getCacheData(SharedKeys.pricePackage),
        suffixText: LocaleKeys.settings_currentValue.translate,
        textController: _savedMoneyController,
        labelText: LocaleKeys.settings_pricePackage.translate);
  }

  TextFormFieldWidget get _packageCountArea {
    return TextFormFieldWidget(
        suffixTextData: _getCacheData(SharedKeys.countPackage),
        suffixText: LocaleKeys.settings_currentValue.translate,
        textController: _packageCountController,
        labelText: LocaleKeys.settings_cigaratteCountPerPackage.translate);
  }

  TextFormFieldWidget get _dailySmokedArea {
    return TextFormFieldWidget(
        suffixTextData: _getCacheData(SharedKeys.dailySmoked),
        suffixText: LocaleKeys.settings_currentValue.translate,
        textController: _smokedCountController,
        labelText: LocaleKeys.settings_dailySmokeCount.translate);
  }

  Observer get _saveButtonText {
    return Observer(
        builder: (context) => _settingsViewModal.isLoading
            ? CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onPrimary,
              )
            : Text(LocaleKeys.buttons_save.translate));
  }
}
