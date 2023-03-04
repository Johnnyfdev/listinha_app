import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha_app/src/modules/settings/presentation/store/settings_store.dart';
import 'package:realm/realm.dart';

import 'modules/home/home_module.dart';
import 'modules/settings/domain/settings_repository.dart';
import 'modules/settings/infra/settings_repository_impl.dart';
import 'modules/settings/presentation/pages/settings_page.dart';
import 'shared/services/storage/realm/realm_config.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.instance<Realm>(Realm(config)),
        Bind.factory<SettingsRepository>((i) => SettingsRepositoryImpl(i())),
        Bind.singleton((i) => SettingStore(i())),
      ];
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/home', module: HomeModule()),
        ChildRoute('/settings', child: (_, args) => const SettingsPage()),
      ];
}
