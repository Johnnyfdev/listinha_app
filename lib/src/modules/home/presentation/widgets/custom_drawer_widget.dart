import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import '../../../settings/presentation/store/settings_store.dart';
import '../../../../shared/definitions/const_values.dart';

class CusotmDrawerWidget extends StatelessWidget {
  const CusotmDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final navigator = Navigator.of(context);

    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final syncStore = context.watch<SettingStore>(
      (store) => store.syncDate,
    );

    final syncDate = syncStore.syncDate.value;

    var syncDateText = 'Nunca';

    if (syncDate != null) {
      final format = DateFormat('dd/MM/yyyy às HH:mm');
      syncDateText = format.format(syncDate);
    }

    return NavigationDrawer(
      onDestinationSelected: (index) {
        const settingsItemIndex = 1;
        if (index == settingsItemIndex) {
          navigator
            ..pop()
            ..pushNamed('/settings');
        }
      },
      children: [
        Padding(
          padding: const EdgeInsets.all(ConstValues.paddingMedium),
          child: Text(
            'Opções',
            style: textTheme.titleSmall,
          ),
        ),
        NavigationDrawerDestination(
          icon: const Icon(Icons.sync),
          label: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Sincronizar'),
                Padding(
                  padding:
                      const EdgeInsets.only(right: ConstValues.paddingNormal),
                  child: Text(
                    syncDateText,
                    style: textTheme.labelSmall!.copyWith(
                      fontSize: ConstValues.fontSizeExtraSmall,
                      color: colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.settings),
          label: Text('Configurações'),
        ),
      ],
    );
  }
}
