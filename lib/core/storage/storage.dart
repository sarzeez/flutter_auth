import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository {
  static StorageRepository? _storageUtil;
  static SharedPreferences? _preferences;

  static Future<StorageRepository?> getInstance() async {
    if (_storageUtil == null) {
      final secureStorage = StorageRepository._();

      await secureStorage._init();
      _storageUtil = secureStorage;
    }

    return _storageUtil;
  }

  StorageRepository._();

  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<bool>? putString(String key, String value) {
    if (_preferences == null) return null;
    return _preferences!.setString(key, value);
  }

  static String? getString(String key) {
    if (_preferences == null) return null;
    return _preferences!.getString(key);
  }

  static Future<bool>? putInt(String key, int value) {
    if (_preferences == null) return null;
    return _preferences!.setInt(key, value);
  }

  static int? getInt(String key) {
    if (_preferences == null) return null;
    return _preferences!.getInt(key);
  }

  static Future<bool>? putBool(String key, bool value) {
    if (_preferences == null) return null;
    return _preferences!.setBool(key, value);
  }

  static bool getBool(String key, {bool defValue = true}) {
    if (_preferences == null) return defValue;
    return _preferences!.getBool(key) ?? defValue;
  }
}
