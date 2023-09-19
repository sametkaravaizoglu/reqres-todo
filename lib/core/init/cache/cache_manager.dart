import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../app/data/enums/preferences_keys.dart';

class CacheManager {
  static final CacheManager _instance = CacheManager._init();

  FlutterSecureStorage? _preferences;
  static CacheManager get instance => _instance;

  CacheManager._init() {
    _preferences = const FlutterSecureStorage();
  }

  Future<void> clearAll() async {
    await _preferences?.deleteAll();
  }

  Future<void> setValue(PreferencesKeys key, dynamic value) async {
    await _preferences?.write(key: key.toString(), value: value);
  }

  Future<String?> getValue(PreferencesKeys key) async {
    return await _preferences?.read(key: key.toString());
  }

  Future<void> clearKey(PreferencesKeys key) async {
    await _preferences?.delete(key: key.toString());
  }
}
