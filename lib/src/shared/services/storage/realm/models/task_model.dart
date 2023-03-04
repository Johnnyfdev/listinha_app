import 'package:realm/realm.dart';

@RealmModel()
class _TaskModel {
  @PrimaryKey()
  late Uuid id;
  late String description;
  bool isCompleted = false;
}
