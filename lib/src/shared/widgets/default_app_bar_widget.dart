import 'package:flutter/material.dart';

class DeafultAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final List<Widget>? actions;
  const DeafultAppBarWidget({
    super.key,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('LISTINHA'),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
