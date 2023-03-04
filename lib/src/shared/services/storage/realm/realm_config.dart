import 'package:realm/realm.dart';

import 'models/settings_model.dart';

LocalConfiguration config = Configuration.local(
  [
    SettingsModel.schema,
  ],
  initialDataCallback: (realm) {
    realm.add(
      SettingsModel('system'),
    );
  },
);
