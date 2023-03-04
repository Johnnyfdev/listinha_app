import 'package:realm/realm.dart';

import 'models/settings_model.dart';
import 'models/task_model.dart';

LocalConfiguration config = Configuration.local(
  [
    SettingsModel.schema,
    TaskModel.schema,
    TaskBoardModel.schema,
  ],
  initialDataCallback: (realm) {
    realm.add(
      SettingsModel('system'),
    );
  },
  schemaVersion: 2,
);
