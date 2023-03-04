import 'package:flutter/material.dart';
import 'package:listinha_app/src/shared/widgets/default_app_bar_widget.dart';

import '../../../../shared/definitions/const_values.dart';
import '../../../../shared/widgets/user_circle_avatar_widget.dart';
import '../widgets/custom_drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CusotmDrawerWidget(),
      appBar: const DeafultAppBarWidget(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: ConstValues.paddingMedium),
            child: UserCircleAvatar(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(ConstValues.paddingMedium),
              child: SegmentedButton<int>(
                segments: const [
                  ButtonSegment(
                    value: 0,
                    label: Text('Todas'),
                  ),
                  ButtonSegment(
                    value: 1,
                    label: Text('Pendentes'),
                  ),
                  ButtonSegment(
                    value: 2,
                    label: Text('Concluídas'),
                  ),
                  ButtonSegment(
                    value: 3,
                    label: Text('Desativadas'),
                  ),
                ],
                selected: const {1},
                onSelectionChanged: (values) {},
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.edit),
        label: const Text('Nova Lista'),
        onPressed: () {
          Navigator.of(context).pushNamed('./edit-taskboard');
        },
      ),
    );
  }
}
