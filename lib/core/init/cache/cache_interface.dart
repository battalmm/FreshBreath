abstract class ICacheManager<T> {
  Future<bool> setStringValue(T key, String value);
  String? getStringValue(T key);
  Future<bool> setIntValue(T key, int value);
  int? getIntValue(T key);
  Future<bool> removeValue(T key);
}
