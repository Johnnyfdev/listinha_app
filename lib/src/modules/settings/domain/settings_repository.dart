import '../../../shared/services/storage/realm/models/settings_model.dart';

abstract class SettingsRepository {
  // TODO: CRIAR UM METODO PRA TROCAR A INSTANCIA DO REALM

  SettingsModel getSettings();
  void saveSettings(String themeModeName, DateTime? syncDate);
  void removeAll();
}
