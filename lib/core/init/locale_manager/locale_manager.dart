import 'package:get_storage/get_storage.dart';

import '../../../app/data/enums/preferences_keys.dart';

class LocaleManager {
  static final LocaleManager _instance = LocaleManager._init();

  GetStorage? _preferences;
  static LocaleManager get instance => _instance;

  LocaleManager._init() {
    GetStorage.init();
    _preferences = GetStorage();
  }

  Future<void> clearAll() async {
    await _preferences?.erase();
  }

  Future<void> setValue(PreferencesKeys key, dynamic value) async {
    await _preferences?.write(key.toString(), value);
  }

  dynamic getValue(PreferencesKeys key) => _preferences?.read(key.toString());

  Future<void> clearKey(PreferencesKeys key) async {
    await _preferences?.remove(key.toString());
  }
}
