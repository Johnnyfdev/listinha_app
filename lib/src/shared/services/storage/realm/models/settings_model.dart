import 'package:realm/realm.dart';
part 'settings_model.g.dart';

@RealmModel()
class _SettingsModel {
  late String themeModeName;
  late DateTime? syncDate;
}
