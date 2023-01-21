part of 'settings.dart';

mixin ControllerMixin on State<SettingsView> {
  late TextEditingController _smokedCountController;
  late TextEditingController _passedTimeController;
  late TextEditingController _savedMoneyController;
  late TextEditingController _packageCountController;

  void init() {
    _smokedCountController = TextEditingController();
    _passedTimeController = TextEditingController();
    _savedMoneyController = TextEditingController();
    _packageCountController = TextEditingController();
  }

  void _disposeController() {
    _smokedCountController.dispose();
    _packageCountController.dispose();
    _savedMoneyController.dispose();
    _passedTimeController.dispose();
  }

  String _getCacheData(SharedKeys key) {
    int value = CacheManager.instance.getIntValue(key) ?? 0;
    return value.toString();
  }
}
