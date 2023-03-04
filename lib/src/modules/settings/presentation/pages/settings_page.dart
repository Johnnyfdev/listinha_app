import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha_app/src/modules/settings/presentation/store/settings_store.dart';

import '../../../../shared/definitions/const_values.dart';
import '../../../../shared/widgets/default_app_bar_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final themeStore = context.watch<SettingStore>(
      (store) => store.themeMode,
    );

    final themeGroupValue = themeStore.themeMode.value;

    return Scaffold(
      appBar: const DeafultAppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(ConstValues.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configurações',
              style: textTheme.titleLarge!.copyWith(
                fontWeight: ConstValues.fontWeightBold,
              ),
            ),
            const SizedBox(height: ConstValues.spacerMedium),
            Text('Tema', style: textTheme.titleSmall),
            const SizedBox(height: ConstValues.spacerSmall),
            RadioListTile(
              value: ThemeMode.system,
              groupValue: themeGroupValue,
              title: Text(
                'Sistema',
                style: textTheme.bodyMedium,
              ),
              onChanged: themeStore.changeThemeMode,
            ),
            RadioListTile(
              value: ThemeMode.light,
              groupValue: themeGroupValue,
              title: Text(
                'Claro',
                style: textTheme.bodyMedium,
              ),
              onChanged: themeStore.changeThemeMode,
            ),
            RadioListTile(
              value: ThemeMode.dark,
              groupValue: themeGroupValue,
              title: Text(
                'Escuro',
                style: textTheme.bodyMedium,
              ),
              onChanged: themeStore.changeThemeMode,
            ),
            const SizedBox(height: ConstValues.spacerMedium),
            Text('Controle de dados', style: textTheme.titleSmall),
            const SizedBox(height: ConstValues.spacerSmall),
            OutlinedButton(
              onPressed: () {
                // TODO: Implement data control page
              },
              child: const Text(
                'Apagar cache e reiniciar o App',
              ),
            )
          ],
        ),
      ),
    );
  }
}
