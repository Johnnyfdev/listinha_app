import 'package:flutter/material.dart';

import '../definitions/const_values.dart';

class UserCircleAvatar extends StatelessWidget {
  const UserCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return InkWell(
      onTap: () {
        // TODO: Implement user profile page
      },
      borderRadius: BorderRadius.circular(
        ConstValues.borderRadiusExtraHuge,
      ),
      highlightColor: colorScheme.primary.withOpacity(
        ConstValues.opacityFull,
      ),
      child: CircleAvatar(
        backgroundColor: colorScheme.primary.withOpacity(
          ConstValues.opacityMedium,
        ),
        child: const Text('J'),
      ),
    );
  }
}
