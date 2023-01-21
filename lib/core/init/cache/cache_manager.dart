import 'package:shared_preferences/shared_preferences.dart';
import 'cache_interface.dart';
import 'shared_keys.dart';

class CacheManager implements ICacheManager<SharedKeys> {
  CacheManager._();
  static final CacheManager _instance = CacheManager._();
  static CacheManager get instance => _instance;

  SharedPreferences? _preferences;
  static preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
    return;
  }

  @override
  Future<bool> setStringValue(SharedKeys key, String value) async {
    if (_preferences != null) {
      final status = await _preferences!.setString(key.name, value);
      return status;
    }
    return false;
  }

  @override
  String? getStringValue(SharedKeys key) {
    if (_preferences != null) {
      final value = _preferences!.getString(key.name);
      return value;
    } else {
      return null;
    }
  }

  @override
  int? getIntValue(SharedKeys key) {
    if (_preferences != null) {
      final value = _preferences!.getInt(key.name);
      return value;
    } else {
      return null;
    }
  }

  @override
  Future<bool> setIntValue(SharedKeys key, int value) async {
    if (_preferences != null) {
      final status = await _preferences!.setInt(key.name, value);
      return status;
    }
    return false;
  }

  @override
  Future<bool> removeValue(SharedKeys key) async {
    if (_preferences != null) {
      final status = await _preferences!.remove(key.name);
      return status;
    }
    return false;
  }
}
