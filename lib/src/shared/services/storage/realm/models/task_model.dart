import 'package:realm/realm.dart';

part 'task_model.g.dart';

@RealmModel()
class _TaskModel {
  @PrimaryKey()
  late Uuid id;
  late String description;
  bool isCompleted = false;
}

@RealmModel()
class _TaskBoardModel {
  @PrimaryKey()
  late Uuid id;
  late String title;
  late List<_TaskModel> tasks;
  bool isEnable = true;
}
