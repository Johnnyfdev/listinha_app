import 'package:flutter/material.dart';

import '../../../../shared/widgets/default_app_bar_widget.dart';

class EditTaskboardPage extends StatefulWidget {
  const EditTaskboardPage({super.key});

  @override
  State<EditTaskboardPage> createState() => _EditTaskboardPageState();
}

class _EditTaskboardPageState extends State<EditTaskboardPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DeafultAppBarWidget(),
    );
  }
}
