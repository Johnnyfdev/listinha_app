import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/edit_taskboard_page.dart';
import 'presentation/pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const HomePage()),
        ChildRoute(
          '/edit-taskboard',
          child: (_, args) => const EditTaskboardPage(),
        ),
      ];
}
