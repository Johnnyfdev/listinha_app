import 'package:flutter/material.dart';

import '../../domain/settings_repository.dart';

class SettingStore {
  final themeMode = ValueNotifier(ThemeMode.system);
  final syncDate = ValueNotifier<DateTime?>(null);

  final SettingsRepository _settingsRepository;

  SettingStore(this._settingsRepository) {
    init();
  }

  void changeThemeMode(ThemeMode? mode) {
    if (mode != null) themeMode.value = mode;
    save();
  }

  void syncDateChanged(DateTime? date) {
    syncDate.value = date;
    save();
  }

  void init() {
    final model = _settingsRepository.getSettings();
    syncDate.value = model.syncDate;
    themeMode.value = getThemeModeByName(model.themeModeName);
  }

  void save() {
    _settingsRepository.saveSettings(
      themeMode.value.name,
      syncDate.value,
    );
  }

  void removeAll() {
    _settingsRepository.removeAll();
  }

  ThemeMode getThemeModeByName(String name) {
    switch (name) {
      case 'system':
        return ThemeMode.system;
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
