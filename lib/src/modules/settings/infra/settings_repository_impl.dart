import 'package:realm/realm.dart';

import '../../../shared/services/storage/realm/models/settings_model.dart';
import '../domain/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final Realm realm;

  SettingsRepositoryImpl(this.realm);
  @override
  SettingsModel getSettings() {
    return realm.all<SettingsModel>().first;
  }

  @override
  void saveSettings(String themeModeName, DateTime? syncDate) {
    final model = getSettings();
    realm.write(() {
      model
        ..themeModeName = themeModeName
        ..syncDate = syncDate;
    });
  }

  @override
  void removeAll() {
    realm.deleteAll();
  }
}
